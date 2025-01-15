package org.example;
import java.util.List;
import java.util.Map;

//import java.util.Scanner;
public class ConversationManager {
    private final APIService apiService;
    private final String filePath;
    private final String query;
    private final String coursename;

    public ConversationManager(List<String> questionTypes, String filePath, String query,String coursename) {
        // 初始化 APIService
        this.apiService = new APIService(questionTypes);
        this.filePath = filePath;
        this.query = query;
        this.coursename = coursename;
    }

    public void startConversation() {
//        Scanner scanner = new Scanner(System.in);
//        String userInput;
//        String material = null;

        //进入的逻辑
        System.out.println("欢迎使用对话生成系统。请提供学习材料，或输入“退出”以结束对话：");

        String testMaterial;
        if (filePath != null) {
            // 依据材料找RAG中相关信息
            PythonInvoker pythonInvoker = new PythonInvoker(coursename, filePath, query);
            testMaterial = pythonInvoker.getRAGresult();
            System.out.println("接收到材料如下：" + testMaterial);
        } else {
            testMaterial = ""; // Assign default value if needed later
        }


        //
        //暂时不考虑用户反馈（多轮交互逻辑）
        String result = apiService.callAPIService(testMaterial, query);
//        System.out.println("生成的问题：\n" + result);

        // 调用解析方法(正则化处理)
        Map<String, List<QuestionParser.Question>> parsedQuestions = QuestionParser.parseQuestions(result);

        // 遍历解析后的结果(控制台显示结果，可以注释掉)
        for (Map.Entry<String, List<QuestionParser.Question>> entry : parsedQuestions.entrySet()) {
            System.out.println("Question Type: " + entry.getKey());
            for (QuestionParser.Question question : entry.getValue()) {
                System.out.println(question);
            }
            System.out.println();
        }

        //生成样例
//        Question Type: True or False
//        Question{number='1', question='全扫描技术无法通过系统日志或防火墙被检测到。', options=null, answer='False', analysis='全扫描的隐蔽性差，容易被目标系统的日志记录和防火墙屏蔽。'}
//        Question{number='2', question='全扫描技术仅能用于检测开放的端口，不能提供其他任何网络信息。', options=null, answer='False', analysis='除了检测开放的端口，全扫描还可用于网络拓扑发现、操作系统探测等，收集目标主机或网络的更多信息。'}
//        Question{number='3', question='全扫描需要管理员权限才能执行。', options=null, answer='False', analysis='全扫描技术实现简单且不需要管理员权限，可以由普通用户执行。'}
//
//        Question Type: Multiple Choice
//        Question{number='1', question='全扫描（TCP Connect 扫描）依赖于哪种机制来检测端口的状态？', options=[四次握手, 二次握手, 三次握手, 无需握手], answer='C', analysis='全扫描通过发送一个SYN请求，并期待回应一个SYN/ACK来判断端口是否开放，接着发送ACK完成三次握手，建立连接，因此它是基于三次握手机制。'}
//        Question{number='2', question='如果全扫描检测到端口关闭，目标主机会返回什么信号？', options=[SYN/ACK, ACK, RST, RST/ACK], answer='D', analysis='当端口关闭时，目标主机将返回一个RST/ACK信号，表明拒绝连接。'}
//        Question{number='3', question='使用哪个系统命令可以启动一个全扫描来检测开放的端口？', options=[ping, traceroute, arp, nmap], answer='D', analysis='全扫描通常使用nmap这样的端口扫描工具，nmap -sS 192.168.1.18 就是一个典型的全扫描命令用于扫描和获取服务信息。'}


//        while(true){
//            System.out.print("请提出疑问或使用“exit”进行退出：");
//            userInput = scanner.nextLine();
//
//            // 检查是否退出
//            if (userInput.equalsIgnoreCase("退出") || userInput.equalsIgnoreCase("exit")) {
//                System.out.println("对话结束。感谢您的使用！");
//                break;
//            }
//
//            PythonInvoker pythonInvoker = new PythonInvoker("test", "test1.txt", userInput);
//            String testMaterial = pythonInvoker.getRAGresult();
//            System.out.println("接收到材料如下："+testMaterial);
//
//
//            // 第一次输入作为材料
//            if (material == null) {
//                material = testMaterial;
//                System.out.println("已接收材料，正在生成问题...");
//                String result = apiService.callAPIService(material, null);
//                System.out.println("生成的问题：\n" + result);
//            } else {
//                // 后续输入作为用户反馈
//                System.out.println("已接收反馈，正在根据反馈改进问题...");
//                String result = apiService.callAPIService(material, userInput);
//                System.out.println("改进后的问题：\n" + result);
//            }
//        }
//        scanner.close();
    }

}
