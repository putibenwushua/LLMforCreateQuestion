package org.example;
import java.util.Arrays;
import java.util.List;
public class Main {
    public static void main(String[] args) {
        List<String> questionTypes = Arrays.asList("multiple-choice","true-false","fill-in-the-blank","short-answer");
        //新建一个对话即依照新材料生成新题目
        ConversationManager manager = new ConversationManager(questionTypes);
        manager.startConversation();
    }
}