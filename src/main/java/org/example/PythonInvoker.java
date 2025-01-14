package org.example;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class PythonInvoker {
    private final String courseName;
    private final String filePath;
    private final String question;
    private final String pythonInterpreter;
    private final String pythonScript;

    public PythonInvoker(String courseName, String filePath, String question) {
        this.courseName = courseName;
        this.filePath = "./filedata/"+filePath;
        this.question = question;
        // 获取项目根目录
        String projectRoot = new File("").getAbsolutePath();
        this.pythonInterpreter = getPythonInterpreter(projectRoot);
        this.pythonScript = getpythonScript(projectRoot);
    }

    private String getPythonInterpreter(String projectRoot) {
        // 虚拟环境 Python 解释器路径
        return projectRoot + File.separator + "src" + File.separator + "main" +
                File.separator + "python" + File.separator + ".venv" + File.separator + "Scripts" +
                File.separator + "python.exe";
    }

    private String getpythonScript(String projectRoot) {
        return projectRoot + File.separator + "src" + File.separator + "main" +
                File.separator + "python" + File.separator + "main.py";
    }

    public String getRAGresult() {
        try {
            // 构建命令
            List<String> command = buildCommand(courseName, filePath, question);
            // 执行命令
            Process process = executeCommand(command);
            // 处理输出
            String output = readStream(process.getInputStream());
            String errorOutput = readStream(process.getErrorStream());
            // 检查退出码
            checkExitCode(process, errorOutput);
            //去掉无用的信息（信息粗筛）
            output = cleanText(output);
            return output;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private List<String> buildCommand(String courseName, String filePath, String question) {
        List<String> command = new ArrayList<>();
        command.add(pythonInterpreter);
        command.add(pythonScript);
        command.add(courseName);
        command.add(filePath);
        command.add(question);
        return command;
    }

    private Process executeCommand(List<String> command) throws Exception {
        ProcessBuilder pb = new ProcessBuilder(command);

        // 设置工作目录为 Python 文件夹
        pb.directory(new File(new File(pythonScript).getParent()));

        // 设置环境变量 LANG 为 UTF-8（适用于 Python 输出编码）
        pb.environment().put("PYTHONIOENCODING", "UTF-8");

        // 启动进程
        return pb.start();
    }

    private String readStream(InputStream stream) throws Exception {
        StringBuilder output = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append(System.lineSeparator());
            }
        }
        return output.toString().trim();
    }

    private void checkExitCode(Process process, String errorOutput) throws Exception {
        int exitCode = process.waitFor();
        if (exitCode != 0) {
            throw new RuntimeException("Python script failed with exit code " + exitCode + ": " + errorOutput);
        }
    }

    private String cleanText(String originalText) {
        // 去除换行符
        String cleanedText = originalText.replaceAll("\\r\\n|\\n", " ");
        // 去除多余空格
        cleanedText = cleanedText.replaceAll("\\s+", " ");
        // 去除缩进符号
        cleanedText = cleanedText.replaceAll("\\t", "");
        // 去除首尾空格
        cleanedText = cleanedText.trim();
        return cleanedText;
    }

}
