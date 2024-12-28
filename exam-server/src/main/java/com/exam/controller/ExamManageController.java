package com.exam.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.ApiResult;
import com.exam.entity.ExamManage;
import com.exam.serviceimpl.ExamManageServiceImpl;
import com.exam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ExamManageController {

    @Autowired
    private ExamManageServiceImpl examManageService;

    @GetMapping("/exams")
    public ApiResult getAllExams() {
        System.out.println("不分页查询所有试卷");
        List<ExamManage> exams = examManageService.findAll();
        return ApiResultHandler.buildApiResult(200, "请求成功！", exams);
    }

    @GetMapping("/exams/{page}/{size}")
    public ApiResult getExamsWithPagination(@PathVariable("page") Integer page, @PathVariable("size") Integer size) {
        System.out.println("分页查询所有试卷");
        Page<ExamManage> examPage = new Page<>(page, size);
        IPage<ExamManage> examsPage = examManageService.findAll(examPage);
        return ApiResultHandler.buildApiResult(200, "请求成功！", examsPage);
    }

    @GetMapping("/exam/{examCode}")
    public ApiResult getExamById(@PathVariable("examCode") Integer examCode) {
        System.out.println("根据ID查找");
        ExamManage exam = examManageService.findById(examCode);
        if (exam == null) {
            return ApiResultHandler.buildApiResult(10000, "考试编号不存在", null);
        }
        return ApiResultHandler.buildApiResult(200, "请求成功！", exam);
    }

    @DeleteMapping("/exam/{examCode}")
    public ApiResult deleteExamById(@PathVariable("examCode") Integer examCode) {
        int result = examManageService.delete(examCode);
        return ApiResultHandler.buildApiResult(200, "删除成功", result);
    }

    @PutMapping("/exam")
    public ApiResult updateExam(@RequestBody ExamManage examManage) {
        int result = examManageService.update(examManage);
        System.out.print("更新操作执行---");
        return ApiResultHandler.buildApiResult(200, "更新成功", result);
    }

    @PostMapping("/exam")
    public ApiResult addExam(@RequestBody ExamManage examManage) {
        int result = examManageService.add(examManage);
        if (result == 1) {
            return ApiResultHandler.buildApiResult(200, "添加成功", result);
        }
        return ApiResultHandler.buildApiResult(400, "添加失败", result);
    }

    @GetMapping("/examManagePaperId")
    public ApiResult getExamWithPaperId() {
        ExamManage exam = examManageService.findOnlyPaperId();
        if (exam != null) {
            return ApiResultHandler.buildApiResult(200, "请求成功", exam);
        }
        return ApiResultHandler.buildApiResult(400, "请求失败", exam);
    }
}
