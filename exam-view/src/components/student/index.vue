<template>
  <div id="student">
    <el-row class="padding-50">
      <el-col :span="24">
        <ul class="list">
          <li class="logo"><i class="iconfont icon-kaoshi"></i><span>学生考试中心</span></li>
          <li @click="exam()"><a>我的试卷</a></li>
          <router-link to="/scoreTable"><li>我的分数</li></router-link>
          <router-link to="/message"><li>留言</li></router-link>
          <li class="right" @mouseenter="flag = !flag" @mouseleave="flag = !flag">
            <a href="javascript:;"><i class="iconfont icon-Userselect icon"></i>{{ user.userName }}</a>
            <div class="msg" v-if="flag">
              <p @click="manage()">管理中心</p>
              <p class="exit" @click="exit()">退出</p>
            </div>
          </li>
        </ul>
      </el-col>
    </el-row>
    <!--路由区域-->
    <div class="main">
      <router-view></router-view>
    </div>
    <v-footer></v-footer>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';
import { useCookies } from 'vue3-cookies';
import myFooter from '@/components/student/myFooter';

export default {
  name: 'StudentHome',
  components: {
    'v-footer': myFooter,
  },
  setup() {
    const router = useRouter();
    const store = useStore();
    const { cookies } = useCookies();

    // 响应式数据
    const flag = ref(false);
    const user = ref({
      userName: '',
      studentId: '',
    });

    // 初始化用户信息
    const userInfo = () => {
      const studentName = cookies.get('cname');
      const studentId = cookies.get('cid');
      console.log(`studentId: ${studentId}`);
      console.log(`studentName: ${studentName}`);
      user.value.userName = studentName;
      user.value.studentId = studentId;
    };

    // 退出登录
    const exit = () => {
      router.push({ path: '/' }); // 跳转到登录页面
      cookies.remove('cname'); // 清除 cookie
      cookies.remove('cid');
    };

    // 跳转到修改密码页面
    const manage = () => {
      router.push({ path: '/manager' });
    };

    // 跳转到练习模式
    const practice = () => {
      const isPractice = true;
      store.commit('practice', isPractice);
      router.push({ path: '/startExam' });
    };

    // 跳转到考试模式
    const exam = () => {
      const isPractice = false;
      store.commit('practice', isPractice);
      router.push({ path: '/student' });
    };

    // 生命周期钩子
    onMounted(() => {
      userInfo();
    });

    return {
      flag,
      user,
      exit,
      manage,
      practice,
      exam,
    };
  },
};
</script>

<style scoped>
.right .icon {
  margin-right: 6px;
}
#student {
  background: url('../../assets/background.svg') center top / cover no-repeat;
  background-size: cover;
  display: flex;
  flex-direction: column;
  position: relative;
}
#student .padding-50 {
  position: sticky;
  top: 0px;
  z-index: 100;
  padding: 0 50px;
  box-shadow: 0 0 10px 4px rgba(1, 149, 255, 0.1);
  background-color: #fff;
  width: 100%;
}
.list a {
  text-decoration: none;
  color: #334046;
}
li {
  list-style: none;
  height: 60px;
  line-height: 60px;
}
#student .list {
  display: flex;
}
#student .list li {
  padding: 0 20px;
  cursor: pointer;
}
#student .list li:hover {
  background-color: #fff;
  transition: all 1s ease;
}
#student .list li:first-child:hover {
  background-color: #fff;
  transition: all 1s ease;
  color: #0d91f0;
}
#student .list li:hover a {
  color: #0d91f0;
  transition: all 1s ease;
}
#student .list .right {
  margin-left: auto;
  position: relative;
}
#student .list li.right:hover a {
  color: #000;
}
#student .list .logo {
  display: flex;
  font-weight: bold;
  color: #0195ff;
}
#student .list .logo i {
  font-size: 50px;
}
.right .msg {
  text-align: center;
  position: absolute;
  top: 60px;
  left: 0px;
  display: flex;
  flex-direction: column;
  border-radius: 2px;
  border-bottom: 3px solid #ffffff;
  background-color: #fff;
}
.right .msg p {
  height: 40px;
  line-height: 40px;
  width: 127px;
}
.right .msg p:hover {
  background-color: #0195ff;
}
</style>