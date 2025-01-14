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
    // 系统消息
    private JsonObject systemMessage;
    public APIService(List<String> questionTypes) {
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
        // 依照用户选择，初始化系统消息
        initializeLLM(questionTypes);
    }

    // 初始化 LLM 和问题 Prompt（调用一次）
    private void initializeLLM(List<String> questionTypes) {
        this.systemMessage = new JsonObject();
        this.systemMessage.addProperty("role", "system");
        // 构建包含问题类型的描述 Prompt
        String combinedPrompt = Prompt.buildPrompt(questionTypes);
        this.systemMessage.addProperty("content", combinedPrompt);
    }

    // 更新系统 Prompt（支持动态调整）
    public void updateSystemPrompt(List<String> newQuestionTypes) {
        String updatedPrompt = Prompt.buildPrompt(newQuestionTypes);
        this.systemMessage.addProperty("content", updatedPrompt);
    }

    //依据LLM返回获取有用信息
    public String parsingJsonString(String response) {
        JsonObject jsonObject = JsonParser.parseString(response).getAsJsonObject();
        JsonArray choices = jsonObject.getAsJsonArray("choices");
        JsonObject message = choices.get(0).getAsJsonObject().getAsJsonObject("message");
        String content = message.get("content").getAsString();

        System.out.println("GPT response: " + content);
        return content;
    }

    // 添加消息到历史记录
    private void addToHistory(String role, String content) {
        JsonObject message = new JsonObject();
        message.addProperty("role", role);
        message.addProperty("content", content);
        messageHistory.add(message);
    }

    //构建request
    private JsonObject buildRequest(String material, String userFeedback) {
        JsonObject requestBody = new JsonObject();
        JsonArray messages = new JsonArray();

        //添加系统消息
        messages.add(this.systemMessage);

        // 添加用户材料和反馈
        addToHistory("user",material);
        if (userFeedback != null && !userFeedback.isEmpty()) {
            addToHistory( "user","create the questions based on this prompt: " + userFeedback);
        }

        // 将历史记录写入请求体
        for (JsonObject message : messageHistory) {
            messages.add(message);
        }

        // 设置温度等参数
        requestBody.add("messages", messages);
        requestBody.addProperty("temperature", 0.9);
        requestBody.addProperty("max_tokens", 3000);

        return requestBody;
    }

    //调用API解析响应
    private String callLLM(JsonObject requestBody) {
        String response = azureClient.callAzureAPI("chat/completions", requestBody.toString());
        return parsingJsonString(response);
    }

    //真的用户与此类交互接口
    public String callAPIService(String material, String userFeedback) {
        JsonObject requestBody = buildRequest(material, userFeedback);
        String content = callLLM(requestBody);
        //更新历史记录
        addToHistory("assistant",material);

        return content;
    }
}
