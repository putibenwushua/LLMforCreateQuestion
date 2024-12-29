<template>
  <div id="manager">
    <el-form :model="ruleForm2" :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
      <h3 class="alter">修改你的密码</h3>
      <el-form-item label="密码" prop="pass" class="pass">
        <el-input type="password" v-model="ruleForm2.pass" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="checkPass">
        <el-input type="password" v-model="ruleForm2.checkPass" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { ref } from 'vue';
import { useCookies } from 'vue3-cookies';
import axios from 'axios';
import { ElMessage } from 'element-plus';

export default {
  name: 'ManagerCenter',
  setup() {
    const {cookies} = useCookies();

    // 表单数据
    const ruleForm2 = ref({
      pass: '',
      checkPass: '',
    });

    // 表单验证规则
    const validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else {
        if (ruleForm2.value.checkPass !== '') {
          ruleForm2.value.validateField('checkPass');
        }
        callback();
      }
    };

    const validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== ruleForm2.value.pass) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };

    const rules2 = ref({
      pass: [{validator: validatePass, trigger: 'blur'}],
      checkPass: [{validator: validatePass2, trigger: 'blur'}],
    });

    // 提交表单
    const submitForm = () => {
      ruleForm2.value.validate((valid) => {
        if (valid) {
          const studentId = cookies.get('cid');
          axios
              .put('/api/studentPWD', {
                pwd: ruleForm2.value.pass,
                studentId,
              })
              .then((res) => {
                if (res.data != null) {
                  ElMessage({
                    message: '密码修改成功...',
                    type: 'success',
                  });
                }
              })
              .catch((error) => {
                console.error('修改密码失败:', error);
              });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    };

    // 重置表单
    const resetForm = () => {
      ruleForm2.value.resetFields();
    };

    return {
      ruleForm2,
      rules2,
      submitForm,
      resetForm,
    };
  },
};
</script>

<style scoped>
#manager .pass label {
  color: red;
  font-size: 20px;
}

#manager {
  width: 600px;
  margin: 0 auto;
  margin-top: 100px;
  text-align: center;
  margin-bottom: 300px;
}

#manager .alter {
  margin: 30px 0px;
}
</style>