package com.rabbiter.oes.entity;

/**
 * ClassName: LLMQuestion
 * Package: com.rabbiter.oes.entity
 * Description:
 *
 * @version 1.0
 * @Author 中科院软件所-智能博弈-刘鹏翔
 * @Create 2025/1/14 20:19
 */
public class LLMQuestion {
    private String description;    //老师问题描述
    private String filePath;     //文件路径
    private String questionType;    //问题类型：1-选择题，2-填空题，3-判断题
    private String subject;      //科目：1-机械设计，2-计算机网络
    private Integer paperId;


    public Integer getPaperId() {
        return paperId;
    }

    public void setPaperId(Integer paperId) {
        this.paperId = paperId;
    }

    // Getters and Setters
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
