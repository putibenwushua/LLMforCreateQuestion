package com.rabbiter.oes.llm;
import java.util.*;
import java.util.regex.*;

public class QuestionParser {

    public static Map<String, List<Question>> parseQuestions(String text) {
        Map<String, List<Question>> questionsByType = new HashMap<>();

        // 分段解析
        String[] sections = text.split("(?=\\*\\*(Multiple Choice Questions|True or False Questions|Fill-in-the-Blank Questions|Short-Answer Question)\\*\\*)");

        for (String section : sections) {
            if (section.startsWith("**Multiple Choice Questions**")) {
                questionsByType.put("multiple-choice", parseMultipleChoice(section));
            } else if (section.startsWith("**True or False Questions**")) {
                questionsByType.put("true-false", parseTrueFalse(section));
            } else if (section.startsWith("**Fill-in-the-Blank Questions**")) {
                questionsByType.put("fill-in-the-blank", parseFillInTheBlank(section));
            } else if (section.startsWith("**Short-Answer Question**")) {
                questionsByType.put("Short Answer", parseShortAnswer(section));
            }
        }

        return questionsByType;
    }

    private static List<Question> parseMultipleChoice(String section) {
        List<Question> questions = new ArrayList<>();
        Pattern pattern = Pattern.compile("(\\d+)\\.\\s(.*?)\\n\\s*A\\.\\s(.*?)\\n\\s*B\\.\\s(.*?)\\n\\s*C\\.\\s(.*?)\\n\\s*D\\.\\s(.*?)\\n\\s*Answer:\\s([A-D])\\n\\s*Analysis:\\s(.*)");
        Matcher matcher = pattern.matcher(section);
        while (matcher.find()) {
            questions.add(new Question(
                    matcher.group(1),
                    matcher.group(2),
                    List.of(matcher.group(3), matcher.group(4), matcher.group(5), matcher.group(6)),
                    matcher.group(7),
                    matcher.group(8)
            ));
        }
        return questions;
    }

    private static List<Question> parseTrueFalse(String section) {
        List<Question> questions = new ArrayList<>();
        Pattern pattern = Pattern.compile("(\\d+)\\.\\s(.*?)\\n\\s*Answer:\\s(True|False)\\n\\s*Analysis:\\s(.*)");
        Matcher matcher = pattern.matcher(section);
        while (matcher.find()) {
            questions.add(new Question(
                    matcher.group(1),
                    matcher.group(2),
                    null,
                    matcher.group(3),
                    matcher.group(4)
            ));
        }
        return questions;
    }

    private static List<Question> parseFillInTheBlank(String section) {
        List<Question> questions = new ArrayList<>();
        Pattern pattern = Pattern.compile("(\\d+)\\.\\s(.*?)\\n\\s*Answer:\\s(.*)");
        Matcher matcher = pattern.matcher(section);
        while (matcher.find()) {
            questions.add(new Question(
                    matcher.group(1),
                    matcher.group(2),
                    null,
                    matcher.group(3),
                    null
            ));
        }
        return questions;
    }

    private static List<Question> parseShortAnswer(String section) {
        List<Question> questions = new ArrayList<>();
        Pattern pattern = Pattern.compile("(\\d+)\\.\\s(.*?)\\n\\s*Answer:\\s(.*)");
        Matcher matcher = pattern.matcher(section);
        while (matcher.find()) {
            questions.add(new Question(
                    matcher.group(1),
                    matcher.group(2),
                    null,
                    matcher.group(3),
                    null
            ));
        }
        return questions;
    }

    // Question 数据类
    public static class Question {
        private final String number;
        private final String question;
        private final List<String> options;
        private final String answer;

        public String getNumber() {
            return number;
        }

        public String getQuestion() {
            return question;
        }

        public List<String> getOptions() {
            return options;
        }

        public String getAnswer() {
            return answer;
        }

        public String getAnalysis() {
            return analysis;
        }

        private final String analysis;

        public Question(String number, String question, List<String> options, String answer, String analysis) {
            this.number = number;
            this.question = question;
            this.options = options;
            this.answer = answer;
            this.analysis = analysis;
        }

        @Override
        public String toString() {
            return "Question{" +
                    "number='" + number + '\'' +
                    ", question='" + question + '\'' +
                    ", options=" + options +
                    ", answer='" + answer + '\'' +
                    ", analysis='" + analysis + '\'' +
                    '}';
        }
    }
}
