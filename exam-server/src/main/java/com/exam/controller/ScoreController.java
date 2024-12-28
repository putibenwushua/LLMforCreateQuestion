package com.exam.controller;

import com.exam.entity.ApiResult;
import com.exam.entity.Score;
import com.exam.serviceimpl.ScoreServiceImpl;
import com.exam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ScoreController {
    @Autowired
    private ScoreServiceImpl scoreService;

    @GetMapping("/scores")
    public ApiResult findAllScores() {
        List<Score> scores = scoreService.findAll();
        return ApiResultHandler.buildApiResult(200, "查询所有学生成绩", scores);
    }

    @GetMapping("/score/{studentId}")
    public ApiResult findScoreByStudentId(@PathVariable("studentId") Integer studentId) {
        List<Score> scores = scoreService.findById(studentId);
        if (!scores.isEmpty()) {
            return ApiResultHandler.buildApiResult(200, "根据ID查询成绩", scores);
        } else {
            return ApiResultHandler.buildApiResult(400, "ID不存在", scores);
        }
    }

    @PostMapping("/score")
    public ApiResult addScore(@RequestBody Score score) {
        int result = scoreService.add(score);
        if (result == 0) {
            return ApiResultHandler.buildApiResult(400, "成绩添加失败", result);
        } else {
            return ApiResultHandler.buildApiResult(200, "成绩添加成功", result);
        }
    }

    @GetMapping("/scores/{examCode}")
    public ApiResult findScoresByExamCode(@PathVariable("examCode") Integer examCode) {
        List<Score> scores = scoreService.findByExamCode(examCode);
        return ApiResultHandler.buildApiResult(200, "查询成功", scores);
    }

}
