package org.example;
import java.util.List;
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

        //依据材料找RAG中相关信息
        PythonInvoker pythonInvoker = new PythonInvoker(coursename, filePath, query);
        String testMaterial = pythonInvoker.getRAGresult();
        System.out.println("接收到材料如下："+testMaterial);

        //
        //暂时不考虑用户反馈（多轮交互逻辑）
        String result = apiService.callAPIService(testMaterial, query);
        System.out.println("生成的问题：\n" + result);

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
