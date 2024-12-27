package org.example;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
public class ConversationManager {

    private final APIService apiService;

    public ConversationManager(List<String> questionTypes) {
        // 初始化 APIService
        this.apiService = new APIService(questionTypes);
    }

    public void startConversation() {
        Scanner scanner = new Scanner(System.in);
        String userInput;
        String material = null;

        System.out.println("欢迎使用对话生成系统。请提供学习材料，或输入“退出”以结束对话：");

        while(true){
            System.out.print("请提供材料：");
            userInput = scanner.nextLine();

            // 检查是否退出
            if (userInput.equalsIgnoreCase("退出") || userInput.equalsIgnoreCase("exit")) {
                System.out.println("对话结束。感谢您的使用！");
                break;
            }

            //Example 1 for test
            String testMaterial = "地址解析协议 ARP（Address Resolution Protocol）：\" +\n" +
                    "                \"为网卡（网络适配器）的IP地址到对应的硬件地址提供动态映射。\" +\n" +
                    "                \"可以把网络层32位地址转化为数据链路层MAC48位地址。\\n\" +\n" +
                    "                \"\\n\" +\n" +
                    "                \"ARP 是即插即用的，一个ARP表是自动建立的，不需要系统管理员来配置。";

            // 第一次输入作为材料
            if (material == null) {
                material = testMaterial;
                System.out.println("已接收材料，正在生成问题...");
                String result = apiService.callAPIService(material, null);
                System.out.println("生成的问题：\n" + result);
            } else {
                // 后续输入作为用户反馈
                System.out.println("已接收反馈，正在根据反馈改进问题...");
                String result = apiService.callAPIService(material, userInput);
                System.out.println("改进后的问题：\n" + result);
            }
        }
        scanner.close();
    }

}
