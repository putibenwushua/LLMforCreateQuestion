<template>
  <section class="index">
    <div class="hello">
      <i class="iconfont icon-xihuan"></i><span>很高兴遇见你,{{user.userName}}</span>
    </div>
    <div class="msg">
      <p class="title">系统公告：</p>
      <ul>
        <li @click="openMsg()"><i class="iconfont icon-flag"></i>留言功能已开通</li>
        <li @click="openMsg2()"><i class="iconfont icon-flag"></i>试题难度一下降</li>
        <li @click="openMsg3()"><i class="iconfont icon-flag"></i>测试1</li>
        <li @click="openMsg3()"><i class="iconfont icon-flag"></i>测试2</li>
        <li @click="openMsg3()"><i class="iconfont icon-flag"></i>测试3</li>
      </ul>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue';
import { useCookies } from 'vue3-cookies';

const { cookies } = useCookies();

// 用户信息
const user = ref({
  userName: null,
  userId: null
});

// 获取用户信息
const getUserInfo = () => {
  const userName = cookies.get("cname");
  const userId = cookies.get("cid");
  user.value.userName = userName;
  user.value.userId = userId;
};

// 调用 getUserInfo 函数
onMounted(() => {
  getUserInfo();
});

// 打开留言消息
const openMsg = () => {
  window.alert('留言功能已开通，请管理员认真查看用户对本系统的留言', '留言功能已开通', {
    confirmButtonText: '确定'
  });
};

// 打开试题难度下降消息
const openMsg2 = () => {
  window.alert('试题难度下降', '试题难度下降', {
    confirmButtonText: '确定'
  });
};

// 打开测试消息
const openMsg3 = () => {
  window.alert('测试', '测试', {
    confirmButtonText: '确定'
  });
};
</script>

<style lang="scss" scoped>
.index {
  margin-left: 70px;
  .hello {
    font-size: 20px;
    color: #726f70;
    .icon-xihuan {
      font-size: 30px;
      color: #dd6572;
    }
  }
  .msg {
    .title {
      font-size: 16px;
      color: #000;
      margin-top: 20px;
      margin-left: 10px;
    }
    ul {
      display: flex;
      flex-direction: column;
      width: 200px;
      overflow: hidden;
    }
    li {
      margin-top: 10px;
      font-size: 14px;
      color: lightcoral;
      cursor: pointer;
      display: inline-block;
    }
  }
}
</style>

