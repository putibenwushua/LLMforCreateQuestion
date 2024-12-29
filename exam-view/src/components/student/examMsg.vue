<template>
  <div id="msg">
    <div class="title">
      <span>试卷列表</span>
      <span>/ {{ examData.source }}</span>
    </div>
    <div class="wrapper">
      <ul class="top">
        <li class="example">{{ examData.source }}</li>
        <li><i class="iconfont icon-pen-"></i></li>
        <li><i class="iconfont icon-share"></i></li>
        <li class="right">
          <div>
            <span class="count">总分</span>
            <span class="score">{{ totalScore }}</span>
          </div>
        </li>
      </ul>
      <ul class="bottom">
        <li>考试时间：{{ examData.examDate }}</li>
        <li>来自 {{ examData.institute }}</li>
        <li class="btn">{{ examData.type }}</li>
        <li class="right"><el-button @click="toAnswer(examData.examCode)">开始答题</el-button></li>
      </ul>
      <ul class="info">
        <li @click="dialogVisible = true"><a href="javascript:;"><i class="iconfont icon-info"></i>考生须知</a></li>
      </ul>
    </div>
    <div class="content">
      <el-collapse v-model="activeName">
        <el-collapse-item class="header" name="0">
          <template #title>
            <div class="title">
              <span>{{ examData.source }}</span><i class="header-icon el-icon-info"></i>
              <span class="time">{{ examData.totalScore }}分 / {{ examData.totalTime }}分钟</span>
              <el-button type="primary" size="small">点击查看试题详情</el-button>
            </div>
          </template>
          <el-collapse class="inner">
            <el-collapse-item>
              <template #title>
                <div class="titlei">选择题 (共{{ topicCount[0] }}题 共计{{ score[0] }}分)</div>
              </template>
              <div class="contenti">
                <ul class="question" v-for="(list, index) in topic[1]" :key="index">
                  <li>{{ index + 1 }}. {{ list.question }} {{ list.score }}分</li>
                </ul>
              </div>
            </el-collapse-item>
            <el-collapse-item>
              <template #title>
                <div class="titlei">填空题 (共{{ topicCount[1] }}题 共计{{ score[1] }}分)</div>
              </template>
              <div class="contenti">
                <ul class="question" v-for="(list, index) in topic[2]" :key="index">
                  <li>{{ topicCount[0] + index + 1 }}.{{ list.question }} {{ list.score }}分</li>
                </ul>
              </div>
            </el-collapse-item>
            <el-collapse-item>
              <template #title>
                <div class="titlei">判断题 (共{{ topicCount[2] }}题 共计{{ score[2] }}分)</div>
              </template>
              <div class="contenti">
                <ul class="question" v-for="(list, index) in topic[3]" :key="index">
                  <li>{{ topicCount[0] + topicCount[1] + index + 1 }}. {{ list.question }} {{ list.score }}分</li>
                </ul>
              </div>
            </el-collapse-item>
          </el-collapse>
        </el-collapse-item>
      </el-collapse>
    </div>
    <!--考生须知对话框-->
    <el-dialog
        title="考生须知"
        v-model="dialogVisible"
        width="30%">
      <span>{{ examData.tips }}</span>
      <template #footer>
        <el-button @click="dialogVisible = false">知道了</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script>
import { ref, onMounted, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';

export default {
  name: 'ExamDetail',
  setup() {
    const route = useRoute();
    const router = useRouter();

    // 响应式数据
    const dialogVisible = ref(false);
    const activeName = ref('0');
    const topicCount = ref([]);
    const score = ref([]);
    const examData = ref({});
    const topic = ref({});

    // 计算属性：总分
    const totalScore = computed(() => {
      return score.value.reduce((sum, current) => sum + current, 0);
    });

    // 初始化页面数据
    const init = async () => {
      const examCode = route.query.examCode; // 获取路由传递过来的试卷编号
      try {
        const examResponse = await axios.get(`/api/exam/${examCode}`);
        examData.value = { ...examResponse.data.data };
        examData.value.examDate = examData.value.examDate.substr(0, 10);

        const paperId = examData.value.paperId;
        const paperResponse = await axios.get(`/api/paper/${paperId}`);
        topic.value = { ...paperResponse.data };

        const keys = Object.keys(topic.value); // 对象转数组
        keys.forEach((e) => {
          const data = topic.value[e];
          topicCount.value.push(data.length);
          const currentScore = data.reduce((sum, item) => sum + item.score, 0);
          score.value.push(currentScore); // 把每种题型总分存入 score
        });
      } catch (error) {
        console.error('初始化数据失败:', error);
      }
    };

    // 跳转到答题页面
    const toAnswer = (id) => {
      router.push({ path: '/answer', query: { examCode: id } });
    };

    // 生命周期钩子
    onMounted(() => {
      init();
    });

    return {
      dialogVisible,
      activeName,
      topicCount,
      score,
      examData,
      topic,
      totalScore,
      toAnswer,
    };
  },
};
</script>

<style lang="scss" scoped>
/* 样式保持不变 */
.bottom {
  .right {
    .el-button {
      color: #409eff;
      border-color: #c6e2ff;
      background-color: #ecf5ff;
    }
  }
}
.right {
  margin-left: auto;
}
.inner .contenti .question {
  margin-left: 40px;
  color: #9a9a9a;
  font-size: 14px;
}
.content .inner .titlei {
  margin-left: 20px;
  font-size: 16px;
  color: #88949b;
  font-weight: bold;
}
.content .title .time {
  font-size: 16px;
  margin-left: 420px;
  color: #999;
}
.content .stitle {
  background-color: #0195ff;
}
.content .title span {
  margin-right: 10px;
}
#msg .content .title {
  font-size: 20px;
  margin: 0px;
  display: flex;
  align-items: center;
}
.content {
  margin-top: 20px;
  background-color: #fff;
}
.content .header {
  padding: 10px 30px;
}
.wrapper .info {
  margin: 20px 0px 0px 20px;
  border-top: 1px solid #eee;
  padding: 20px 0px 10px 0px;
}
.wrapper .info a {
  color: #88949b;
  font-size: 14px;
}
.wrapper .info a:hover {
  color: #0195ff;
}
.wrapper .bottom .btn {
  cursor: pointer;
  padding: 5px 10px;
  border: 1px solid #88949b;
  border-radius: 4px;
}
.wrapper .bottom {
  display: flex;
  margin-left: 20px;
  color: #999;
  font-size: 14px;
  align-items: center;
}
.wrapper .bottom li {
  margin-right: 14px;
}
#msg {
  background-color: #eee;
  width: 1500px;
  margin: 0 auto;
}
#msg .title {
  margin: 20px;
}
#msg .wrapper {
  background-color: #fff;
  padding: 10px;
}
.wrapper .top {
  display: flex;
  margin: 20px;
  align-items: center;
}
.wrapper .top .right {
  margin-left: auto;
}
.wrapper .top .example {
  color: #333;
  font-size: 22px;
  font-weight: 700;
}
.wrapper .top li i {
  margin-left: 20px;
  color: #88949b;
}
.wrapper .right .count {
  margin-right: 60px;
  color: #fff;
  padding: 4px 10px;
  background-color: #88949b;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
  border: 1px solid #88949b;
}
.wrapper .right .score {
  position: absolute;
  left: 53px;
  top: -5px;
  padding: 1px 12px;
  font-size: 20px;
  color: #88949b;
  border: 1px dashed #88949b;
  border-left: none;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
  font-weight: bold;
}
.wrapper .right div {
  position: relative;
}
</style>