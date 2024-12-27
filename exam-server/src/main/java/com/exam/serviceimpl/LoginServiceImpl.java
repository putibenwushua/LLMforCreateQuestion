package com.exam.serviceimpl;

import com.exam.entity.Admin;
import com.exam.entity.Student;
import com.exam.entity.Teacher;
import com.exam.mapper.LoginMapper;
import com.exam.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public Admin adminLogin(Integer userId, String password) {
        return loginMapper.adminLogin(userId,password);
    }

    @Override
    public Teacher teacherLogin(Integer userId, String password) {
        return loginMapper.teacherLogin(userId,password);
    }

    @Override
    public Student studentLogin(Integer userId, String password) {
        return loginMapper.studentLogin(userId,password);
    }
}
