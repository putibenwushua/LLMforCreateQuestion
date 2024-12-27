package com.exam.service;

import com.exam.entity.Admin;
import com.exam.entity.Student;
import com.exam.entity.Teacher;

public interface LoginService {

    public Admin adminLogin(Integer userId, String password);

    public Teacher teacherLogin(Integer userId, String password);

    public Student studentLogin(Integer userId, String password);
}
