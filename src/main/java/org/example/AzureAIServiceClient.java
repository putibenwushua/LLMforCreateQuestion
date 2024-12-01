package org.example;

import okhttp3.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Objects;

public class AzureAIServiceClient {
    private final String apiKey;
    private final String deployment;
    private final String endpoint;
    private final String apiVersion;
    private final OkHttpClient client;
    private static final Logger logger = LoggerFactory.getLogger(AzureAIServiceClient.class);

    // 构造函数
    public AzureAIServiceClient(String apiKey, String deployment, String endpoint, String apiVersion) {
        this.apiKey = apiKey;
        this.deployment = deployment;
        this.endpoint = endpoint;
        this.apiVersion = apiVersion;
        this.client = new OkHttpClient();
    }

    // API 调用方法
    public String callAzureAPI(String operation, String requestBodyString) {
        MediaType mediaType = MediaType.parse("application/json");
        String url = String.format("%s/openai/deployments/%s/%s?api-version=%s", endpoint, deployment, operation, apiVersion);

        logger.info("Request body: {}", requestBodyString);

        RequestBody body = RequestBody.create(requestBodyString, mediaType);
        Request httpRequest = new Request.Builder()
                .url(url)
                .post(body)
                .addHeader("api-key", apiKey)
                .build();

        try (Response response = client.newCall(httpRequest).execute()) {
            if (!response.isSuccessful()) {
                throw new RuntimeException("Unexpected response code: " + response);
            }
            return Objects.requireNonNull(response.body()).string();
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while invoking Azure OpenAI API: " + e.getMessage(), e);
        }
    }
}
