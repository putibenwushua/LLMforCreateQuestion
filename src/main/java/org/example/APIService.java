package org.example;
import io.github.cdimascio.dotenv.Dotenv;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.util.ArrayList;
import java.util.List;

public class APIService {
    private final AzureAIServiceClient azureClient;
    // 用于存储历史记录
    private List<JsonObject> messageHistory;
    public APIService() {
        Dotenv dotenv = Dotenv.configure().load();

        // 读取环境变量
        String modelName = dotenv.get("MODEL_NAME");
        String apiKey = dotenv.get("MODEL_API_KEY");
        String baseUrl = dotenv.get("MODEL_BASE_URL");
        String endpoint = dotenv.get("MODEL_ENDPOINT");

        //        // 测试读取是否顺利
//        System.out.println("Model Name: " + modelName);
//        System.out.println("API Key: " + apiKey);
//        System.out.println("Base URL: " + baseUrl);
//        System.out.println("Endpoint: " + endpoint);

        this.azureClient = new AzureAIServiceClient(apiKey, modelName, baseUrl, endpoint);

        // 初始化消息历史
        this.messageHistory = new ArrayList<>();
    }

    public String callAPIService(String prompt) {
        // 将用户输入的 prompt 添加到历史记录
        JsonObject userMessage = new JsonObject();
        userMessage.addProperty("role", "user");
        userMessage.addProperty("content", prompt);
        messageHistory.add(userMessage);

        // 构建请求的 JSON，包含历史消息
        JsonObject requestBody = new JsonObject();
        JsonArray messages = new JsonArray();

        // 添加系统消息
        JsonObject systemMessage = new JsonObject();
        systemMessage.addProperty("role", "system");

        //这里添加GPT的describe prompt
        systemMessage.addProperty("content", "You are an AI assistant that helps people create question.");
        messages.add(systemMessage);

        // 添加历史记录中的所有消息
        for (JsonObject message : messageHistory) {
            messages.add(message);
        }

        // 设置温度参数
        requestBody.add("messages", messages);
        requestBody.addProperty("temperature", 0.9);

        // 调用 API 并获取响应
        String response = azureClient.callAzureAPI("chat/completions", requestBody.toString());

        // 解析 JSON 字符串
        JsonObject jsonObject = JsonParser.parseString(response).getAsJsonObject();
        JsonArray choices = jsonObject.getAsJsonArray("choices");
        JsonObject message = choices.get(0).getAsJsonObject().getAsJsonObject("message");
        String content = message.get("content").getAsString();

        System.out.println("GPT response: " + content);

        // 将 AI 的回应添加到历史记录中，方便下一轮对话使用
        JsonObject aiMessage = new JsonObject();
        aiMessage.addProperty("role", "assistant");
        aiMessage.addProperty("content", content);
        messageHistory.add(aiMessage);
        return content;
    }
}
