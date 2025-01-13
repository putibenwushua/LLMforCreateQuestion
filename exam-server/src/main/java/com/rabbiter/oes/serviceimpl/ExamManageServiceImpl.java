package com.rabbiter.oes.serviceimpl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rabbiter.oes.entity.ExamManage;
import com.rabbiter.oes.mapper.ExamManageMapper;
import com.rabbiter.oes.service.ExamManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamManageServiceImpl implements ExamManageService {
    @Autowired
    private ExamManageMapper examManageMapper;
    @Autowired
    private PaperServiceImpl paperService;

    private void setMaxScore(List<ExamManage> examManageList) {
        for (ExamManage examManage : examManageList) {
            examManage.setTotalScore(paperService.getMaxScore(examManage.getPaperId()));
        }
    }

    @Override
    public List<ExamManage> findAll() {
        Page<ExamManage> examManage = new Page<>(0,9999);
        List<ExamManage> examManageList = examManageMapper.findAll(examManage).getRecords();
        setMaxScore(examManageList);
        return examManageList;
    }

    @Override
    public IPage<ExamManage> findAll(Page<ExamManage> page) {
        IPage<ExamManage> iPage = examManageMapper.findAll(page);
        setMaxScore(iPage.getRecords());
        return iPage;
    }

    @Override
    public ExamManage findById(Integer examCode) {
        ExamManage examManage = examManageMapper.findById(examCode);
        examManage.setTotalScore(paperService.getMaxScore(examManage.getPaperId()));
        return examManage;
    }

    @Override
    public int delete(Integer examCode) {
        return examManageMapper.delete(examCode);
    }

    @Override
    public int update(ExamManage exammanage) {
        return examManageMapper.update(exammanage);
    }

    @Override
    public int add(ExamManage exammanage) {
        return examManageMapper.add(exammanage);
    }

    @Override
    public ExamManage findOnlyPaperId() {
        return examManageMapper.findOnlyPaperId();
    }
}
