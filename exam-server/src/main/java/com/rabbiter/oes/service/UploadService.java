package com.rabbiter.oes.service;

import com.rabbiter.oes.entity.LLMQuestion;

/**
 * ClassName: UploadService
 * Package: com.rabbiter.oes.service
 * Description:
 *
 * @version 1.0
 * @Author 中科院软件所-智能博弈-刘鹏翔
 * @Create 2025/1/15 20:15
 */
public interface UploadService {

    void handleSubmit(LLMQuestion llmQuestion);
}
