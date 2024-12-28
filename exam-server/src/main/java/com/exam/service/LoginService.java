package com.exam.service;

import com.exam.entity.Admin;
import com.exam.entity.Student;
import com.exam.entity.Teacher;

public interface LoginService {

    Admin adminLogin(Integer userId, String password);

    Teacher teacherLogin(Integer userId, String password);

    Student studentLogin(Integer userId, String password);
}
