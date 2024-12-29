package com.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.Teacher;

import java.util.List;

public interface TeacherService {

    IPage<Teacher> findAll(Page<Teacher> page);

    Teacher findById(Integer teacherId);

    int deleteById(Integer teacherId);

    int update(Teacher teacher);

    int add(Teacher teacher);
}
