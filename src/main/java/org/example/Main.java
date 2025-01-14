package org.example;
import java.util.Arrays;
import java.util.List;
public class Main {
    public static void main(String[] args) {
        //怀疑是maxToken出了问题，导致很多时候会超时，去掉其中的几个类型题目会快很多(overcomed 修改了超时响应时间，增加了maxtoken参数)
        List<String> questionTypes = Arrays.asList("multiple-choice","true-false","fill-in-the-blank","short-answer");
        //用户提问
        String userQuery = "请出一些关于扫描的题目";
        //课程名
        String courseName = "Internet";
        //文件路径
        String filepath = "test1.txt";
        //新建一个对话即依照新材料生成新题目
        ConversationManager manager = new ConversationManager(questionTypes,filepath, userQuery, courseName);
        manager.startConversation();

//        // test API correct
//        APIService apiService = new APIService(questionTypes);
//        String testMaterial = "地址解析协议 ARP（Address Resolution Protocol）：\" +\n" +
//                "                \"为网卡（网络适配器）的IP地址到对应的硬件地址提供动态映射。\" +\n" +
//                "                \"可以把网络层32位地址转化为数据链路层MAC48位地址。\\n\" +\n" +
//                "                \"\\n\" +\n" +
//                "                \"ARP 是即插即用的，一个ARP表是自动建立的，不需要系统管理员来配置。";
//
//        String result = apiService.callAPIService(testMaterial, null);
//        System.out.println(result);



    }
}