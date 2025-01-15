package org.example;
import java.util.ArrayList;
import java.util.List;
// 该部分的逻辑为在给大模型初始化设定，依照用户勾选需要生成的题目类型构造对应的describe prompt
// 调用时构造需要的问题类型 如
// List<String> questionTypes = Arrays.asList("","");
// 然后使用Prompt.buildPrompt(questionTypes);即可

public class Prompt {
    // 总体描述 Prompt
    public static String getDescribePrompt() {
        return  "You are an AI assistant tasked with creating various types of questions based on the provided materials. " +
                "The goal is to generate thoughtful, non-repetitive, and clear questions that evaluate the user's understanding. " +
                "Adhere strictly to the following output format for each question type:\n\n" +
                "**Multiple Choice Questions**\n" +
                "1. [Question]\n" +
                "   A. [Option 1]\n" +
                "   B. [Option 2]\n" +
                "   C. [Option 3]\n" +
                "   D. [Option 4]\n" +
                "   Answer: [Correct Option]\n" +
                "   Analysis: [Detailed Explanation]\n" +
                "Repeat this format for 3 questions.\n\n" +
                "**True or False Questions**\n" +
                "1. [Statement]\n" +
                "   Answer: [True/False]\n" +
                "   Analysis: [Detailed Explanation]\n" +
                "Repeat this format for 3 questions.\n\n" +
                "**Fill-in-the-Blank Questions**\n" +
                "1. [Sentence with a blank to fill, indicated by __]\n" +
                "   Answer: [Correct Answer]\n" +
                "Repeat this format for 3 questions.\n\n" +
                "**Short-Answer Question**\n" +
                "1. [Question]\n" +
                "   Answer: [Detailed Answer]\n\n" +
                "** Important Notes:**\n" +
                "- If the material is in English, it returns English; if the material is in Chinese, it returns Chinese."+
                "- Each section must start with the respective title (**Multiple Choice Questions**, **True or False Questions**, etc.).\n" +
                "- Ensure that all generated questions are non-repetitive and based on the provided material if material is not null.\n" +
                "- Use proper indentation and spacing as shown in the format.\n" +
                "- Questions must be clear and unambiguous.\n" +
                "- Provide answers and explanations where applicable.\n";
    }

    // 获取选择题 Prompt
    public static String getMultipleChoicePrompt() {
        return  "**Multiple Choice Questions**\n" +
                "Generate 3 unique multiple-choice questions. Each question should include 4 options (A, B, C, D), one correct answer, " +
                "and an explanation for why the correct answer is right. You need to make the answers appear evenly among the four options abcd\n" +
                "Output format:\n" +
                "1. [Question]\n" +
                "A. [Option 1]\n" +
                "B. [Option 2]\n" +
                "C. [Option 3]\n" +
                "D. [Option 4]\n" +
                "Answer: [Correct Option]\n" +
                "Analysis: [Explanation]\n" +
                "Repeat this format for all 3 questions." +
                "Example 1:" +
                "Which of the following devices belongs to the physical layer?\n" +
                "A. Repeater\n" +
                "B. Ethernet switch\n" +
                "C. Bridge\n" +
                "D. Gateway\n" +
                "Answer: A\n" +
                "Analysis: Repeater is a physical layer device used for signal amplification and regeneration to extend the network transmission distance.";
    }

    // 获取判断题 Prompt
    public static String getTrueFalsePrompt() {
        return  "**True or False Questions**\n" +
                "Generate 3 unique true or false questions. Each question should test a specific fact or concept from the material. " +
                "Provide the correct answer and a brief explanation.\n" +
                "Output format:\n" +
                "1. [Statement]\n" +
                "Answer: [True/False]\n" +
                "Analysis: [Explanation]\n" +
                "Repeat this format for all 3 questions.";
    }

    // 获取填空题 Prompt
    public static String getFillInTheBlankPrompt() {
        return  "**Fill-in-the-Blank Questions**\n" +
                "Generate 3 unique fill-in-the-blank questions. Each question should require users to recall specific details or facts from the material. " +
                "Provide the correct answer.\n" +
                "Output format:\n" +
                "1. [Sentence with a blank to fill, indicated by __]\n" +
                "Answer: [Correct Answer]\n" +
                "Repeat this format for all 3 questions.";
    }

    // 获取简答题 Prompt
    public static String getShortAnswerPrompt() {
        return  "**Short-Answer Question**\n" +
                "Generate 1 short-answer question. The question should prompt users to provide a concise but detailed explanation. " +
                "Provide the correct answer or a model response.\n" +
                "Output format:\n" +
                "1. [Question]\n" +
                "Answer: [Correct Answer or Model Response]";
    }

    // 根据用户选择组合 Prompt
    public static String buildPrompt(List<String> questionTypes) {
        StringBuilder fullPrompt = new StringBuilder(getDescribePrompt());
        fullPrompt.append("\n\n");
        for (String questionType : questionTypes) {
            switch (questionType.toLowerCase()) {
                case "multiple-choice":
                    fullPrompt.append(getMultipleChoicePrompt()).append("\n\n");
                    break;
                case "true-false":
                    fullPrompt.append(getTrueFalsePrompt()).append("\n\n");
                    break;
                case "fill-in-the-blank":
                    fullPrompt.append(getFillInTheBlankPrompt()).append("\n\n");
                    break;
                case "short-answer":
                    fullPrompt.append(getShortAnswerPrompt()).append("\n\n");
                    break;
                default:
                    fullPrompt.append("Invalid question type: ").append(questionType).append("\n");
            }
        }
        return fullPrompt.toString().trim();
    }
}
