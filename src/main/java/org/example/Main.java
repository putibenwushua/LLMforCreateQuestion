package org.example;
import java.util.Arrays;
import org.example.AzureAIServiceClient;
import io.github.cdimascio.dotenv.Dotenv;//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        APIService AI = new APIService();
        String response = AI.callAPIService("解释一下核函数");
        System.out.println("API Response: " + response);
    }
}