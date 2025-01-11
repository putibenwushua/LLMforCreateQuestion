<template>
  <div id="login">
    <div class="bg"></div>
    <el-row class="main-container">
      <el-col :lg="8" :xs="16" :md="10" :span="10">
        <div class="top">
          <i class="iconfont icon-kaoshi"></i><span class="title">试题库管理系统</span>
        </div>
        <div class="bottom">
          <div class="container">
            <p class="title">用户登录</p>
            <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign" @keyup.enter="login()">
              <el-form-item label="用户名">
                <el-input v-model.number="formLabelAlign.userId" placeholder="请输入用户ID"></el-input>
              </el-form-item>
              <el-form-item label="密码">
                <el-input v-model="formLabelAlign.password" placeholder="请输入密码" type='password'></el-input>
              </el-form-item>
              <div class="submit">
                <el-button type="primary" class="row-login" @click="login()">登录</el-button>
              </div>
              <div class="options">
                <p class="find"><a href="javascript:;">找回密码</a></p>
                <div class="register">
                  <span>没有账号?</span>
                  <span><a href="javascript:;">去注册</a></span>
                </div>
              </div>
            </el-form>
          </div>
        </div>
      </el-col>
    </el-row>
    <el-row class="footer">
      <el-col>
        <p class="msg2"> 【版权所有 ©2022 <a href="https://blog.csdn.net/qq_43378689">瓜月二十三</a> 保留所有权利】</p>
      </el-col>
    </el-row>
    <section class="remind">
      <span>管理员账号：10001</span>
      <span>教师账号：2017001</span>
      <span>测试学生账号：2017113210</span>
      <span>密码都是：123456</span>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useCookies } from 'vue3-cookies';
import { ElMessage } from 'element-plus';
import axios from 'axios';


// 获取路由实例
const router = useRouter();
// 获取 cookies 实例
const { cookies } = useCookies();

// 定义响应式数据
const labelPosition = ref('left');
const formLabelAlign = ref({
  username: '2017113210',
  password: '123456'
});

// 用户登录请求后台处理
const login = async () => {
  console.log("登录操作执行-------");
  try {
    const res = await axios({
      url: `/api/login`,
      method: 'post',
      data: {
        ...formLabelAlign.value
      }
    });
    const resData = res.data.data;
    if (resData!= null) {
      switch (resData.role) {
        case "0":  // 管理员
          cookies.set("cname", resData.adminName);
          cookies.set("cid", resData.adminId);
          cookies.set("role", 0);
          router.push({ path: '/index' }); // 跳转到首页
          break;
        case "1": // 教师
          cookies.set("cname", resData.teacherName);
          cookies.set("cid", resData.teacherId);
          cookies.set("role", 1);
          router.push({ path: '/index' }); // 跳转到教师用户
          break;
        case "2": // 学生
          cookies.set("cname", resData.studentName);
          cookies.set("cid", resData.studentId);
          router.push({ path: '/student' });
          break;
      }
    }
    if (resData == null) { // 错误提示
      ElMessage({
        showClose: true,
        type: 'error',
        message: '用户名或者密码错误'
      });
    }
  } catch (error) {
    console.error('登录失败:', error);
    ElMessage({
      showClose: true,
      type: 'error',
      message: '登录失败，请重试'
    });
  }
};
</script>

<style lang="scss" scoped>
.remind {
  border-radius: 4px;
  padding: 10px 20px;
  display: flex;
  position: fixed;
  right: 20px;
  bottom: 50%;
  flex-direction: column;
  color: #606266;
  background-color: #fff;
  border-left: 4px solid #409eff;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
}
.container {
  margin-bottom: 32px;
}
.container .el-radio-group {
  margin: 30px 0px;
}
a:link {
  color:#0d91f0;
  text-decoration:none;
}
#login {
  font-size: 14px;
  color: #000;
  background-color: #fff;
}
#login .bg {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  overflow-y: auto;
  height: 100%;
  background: url('../../assets/background.svg') center top / cover no-repeat;
  background-size: cover;
  background-color: #fff !important;
}
#login .main-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 90vh;
}
#login .main-container .top {
  font-size: 30px;
  color: #0d91f0;
  display: flex;
  justify-content: center;
  margin-bottom: 40px;
}
#login .top .icon-kaoshi {
  font-size: 80px;
}
#login .top .title {
  margin-top: 20px;
}
#login .bottom {
  display:flex;
  justify-content: center;
  background-color:#fff;
  border-radius: 5px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
#login .bottom .title {
  text-align: center;
  font-size: 30px;
}
.bottom .container .title {
  margin: 30px 0px;;
}
.bottom .submit .row-login {
  width: 100%;
  background-color: #04468b;
  border-color: #04468b;
  margin: 20px 0px 10px 0px;
  padding: 15px 20px;
}
.bottom .submit {
  display: flex;
  justify-content: center;
}
.footer {
  text-align: center;
}
.footer .msg1 {
  font-size: 18px;
  color: #fff;
  margin-bottom: 15px;
}
.footer .msg2 {
  font-size: 14px;
  color: #0d91f0;
  margin-top: 50px;
}
.footer .msg2 a{
  font-size: 14px;
  color: #0d91f0;
  margin-top: 50px;
}
.footer .msg2 a:hover{
  color: #075c7b;
}
.bottom .options {
  margin-bottom: 40px;
  color: #0d91f0;
  display: flex;
  justify-content: space-between;
}
.bottom .options > a {
  color: #0d91f0;
}
.bottom .options .register span:nth-child(1) {
  color: #8C8C8C;
}
</style>
