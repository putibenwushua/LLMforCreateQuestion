package com.exam.controller;

import com.exam.entity.*;
import com.exam.serviceimpl.FillQuestionServiceImpl;
import com.exam.serviceimpl.JudgeQuestionServiceImpl;
import com.exam.serviceimpl.MultiQuestionServiceImpl;
import com.exam.serviceimpl.PaperServiceImpl;
import com.exam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class PaperController {

    @Autowired
    private PaperServiceImpl paperService;

    @Autowired
    private JudgeQuestionServiceImpl judgeQuestionService;

    @Autowired
    private MultiQuestionServiceImpl multiQuestionService;

    @Autowired
    private FillQuestionServiceImpl fillQuestionService;

    @GetMapping("/papers")
    public ApiResult<PaperManage> getAllPapers() {
        List<PaperManage> paperList = paperService.findAll();
        return ApiResultHandler.buildApiResult(200, "请求成功", paperList);
    }

    @GetMapping("/paper/{paperId}")
    public Map<Integer, List<?>> getQuestionsByPaperId(@PathVariable("paperId") Integer paperId) {
        List<MultiQuestion> multiQuestions = multiQuestionService.findByIdAndType(paperId);   // 选择题题库 1
        List<FillQuestion> fillQuestions = fillQuestionService.findByIdAndType(paperId);     // 填空题题库 2
        List<JudgeQuestion> judgeQuestions = judgeQuestionService.findByIdAndType(paperId);   // 判断题题库 3

        Map<Integer, List<?>> questionMap = new HashMap<>();
        questionMap.put(1, multiQuestions);
        questionMap.put(2, fillQuestions);
        questionMap.put(3, judgeQuestions);

        return questionMap;
    }

    @PostMapping("/paperManage")
    public ApiResult addPaper(@RequestBody PaperManage paperManage) {
        int result = paperService.add(paperManage);
        if (result != 0) {
            return ApiResultHandler.buildApiResult(200, "添加成功", result);
        }
        return ApiResultHandler.buildApiResult(400, "添加失败", result);
    }

}
