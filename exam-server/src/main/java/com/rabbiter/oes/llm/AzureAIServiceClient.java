package com.rabbiter.oes.llm;

import okhttp3.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.SocketTimeoutException;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

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
        //处理可能的超时
        this.client = new OkHttpClient.Builder()
                .connectTimeout(20, TimeUnit.SECONDS)
                .readTimeout(20, TimeUnit.SECONDS)
                .writeTimeout(20, TimeUnit.SECONDS)
                .build();
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
        } catch (SocketTimeoutException e) {
            System.err.println("Timeout occurred: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while invoking Azure OpenAI API: " + e.getMessage(), e);
        }
        return null;
    }
}
