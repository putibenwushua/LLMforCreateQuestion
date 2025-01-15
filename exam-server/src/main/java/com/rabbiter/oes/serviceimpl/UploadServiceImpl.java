package com.rabbiter.oes.serviceimpl;

import com.rabbiter.oes.entity.*;
import com.rabbiter.oes.llm.ConversationManager;
import com.rabbiter.oes.llm.QuestionParser;
import com.rabbiter.oes.mapper.FillQuestionMapper;
import com.rabbiter.oes.mapper.JudgeQuestionMapper;
import com.rabbiter.oes.mapper.MultiQuestionMapper;
import com.rabbiter.oes.mapper.PaperMapper;
import com.rabbiter.oes.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * ClassName: UploadServiceImpl
 * Package: com.rabbiter.oes.serviceimpl
 * Description:
 *
 * @version 1.0
 * @Author 中科院软件所-智能博弈-刘鹏翔
 * @Create 2025/1/15 20:16
 */
@Service
public class UploadServiceImpl implements UploadService {

    @Autowired
    private MultiQuestionMapper multiQuestionMapper;

    @Autowired
    private JudgeQuestionMapper judgeQuestionMapper;

    @Autowired
    private FillQuestionMapper fillQuestionMapper;

    @Autowired
    private PaperMapper paperMapper;

    @Override
    public void handleSubmit(LLMQuestion llmQuestion) {
        List<String> questionTypes = Arrays.asList(llmQuestion.getQuestionType());
        //用户提问
        String userQuery = llmQuestion.getDescription();
        //课程名
        String courseName = llmQuestion.getSubject();
        //文件路径
        String filepath = llmQuestion.getFilePath();
        Integer paperId = llmQuestion.getPaperId();
        //新建一个对话即依照新材料生成新题目
        ConversationManager manager = new ConversationManager(questionTypes,filepath, userQuery, courseName);
        Map<String, List<QuestionParser.Question>> questions =  manager.startConversation();
        String questionType = llmQuestion.getQuestionType();
        if (questionType.equals("multiple-choice")){
            Integer qCode = 1;
            MultiQuestion multiQuestion = new MultiQuestion();
            List<QuestionParser.Question> needQuestions = questions.get(questionType);
            for(int i=0; i < needQuestions.size(); i++){
                QuestionParser.Question needQuestion = needQuestions.get(i);
                multiQuestion.setSubject(courseName);
                multiQuestion.setQuestion(needQuestion.getQuestion());
                multiQuestion.setAnswerA(needQuestion.getOptions().get(0));
                multiQuestion.setAnswerB(needQuestion.getOptions().get(1));
                multiQuestion.setAnswerC(needQuestion.getOptions().get(2));
                multiQuestion.setAnswerD(needQuestion.getOptions().get(3));
                multiQuestion.setRightAnswer(needQuestion.getAnswer());
                multiQuestion.setAnalysis(needQuestion.getAnalysis());
                multiQuestion.setScore(2);
                multiQuestion.setSection("应用层");
                multiQuestion.setLevel("3");
                multiQuestionMapper.add(multiQuestion);

                Integer questionId =  multiQuestion.getQuestionId();
                PaperManage paperManage = new PaperManage(llmQuestion.getPaperId(), qCode, questionId);
                paperMapper.add(paperManage);
            }
        }else if(questionType.equals("fill-in-the-blank")){
            Integer qCode = 2;
            FillQuestion fillQuestion = new FillQuestion();
            List<QuestionParser.Question> needQuestions = questions.get(questionType);
            for(int i=0; i < needQuestions.size(); i++){
                QuestionParser.Question needQuestion = needQuestions.get(i);
                fillQuestion.setSubject(courseName);
                fillQuestion.setQuestion(needQuestion.getQuestion());
                fillQuestion.setAnswer(needQuestion.getAnswer());
                fillQuestion.setAnalysis(needQuestion.getAnalysis());
                fillQuestion.setScore(2);
                fillQuestion.setLevel("3");
                fillQuestion.setSection("应用层");
                fillQuestionMapper.add(fillQuestion);
                Integer questionId = fillQuestion.getQuestionId();
                PaperManage paperManage = new PaperManage(llmQuestion.getPaperId(), qCode, questionId);
                paperMapper.add(paperManage);
            }
        }else{
            Integer qCode = 3;
            JudgeQuestion judgeQuestion = new JudgeQuestion();
            List<QuestionParser.Question> needQuestions = questions.get(questionType);
            for(int i=0; i < needQuestions.size(); i++){
                QuestionParser.Question needQuestion = needQuestions.get(i);
                judgeQuestion.setSubject(courseName);
                judgeQuestion.setQuestion(needQuestion.getQuestion());
                judgeQuestion.setAnswer(needQuestion.getAnswer());
                judgeQuestion.setAnalysis(needQuestion.getAnalysis());
                judgeQuestion.setScore(2);
                judgeQuestion.setLevel("3");
                judgeQuestion.setSection("应用层");
                judgeQuestionMapper.add(judgeQuestion);
                Integer questionId = judgeQuestion.getQuestionId();
                PaperManage paperManage = new PaperManage(llmQuestion.getPaperId(), qCode, questionId);
                paperMapper.add(paperManage);
            }
        }



    }
}
