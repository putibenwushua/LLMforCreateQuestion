package org.example;
import java.util.Arrays;
import java.util.List;
import org.example.AzureAIServiceClient;
import io.github.cdimascio.dotenv.Dotenv;//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        List<String> questionTypes = Arrays.asList("multiple-choice","true-false","fill-in-the-blank","short-answer");
        //新建一个对话即依照新材料生成新题目
        ConversationManager manager = new ConversationManager(questionTypes);
        manager.startConversation();
    }
}