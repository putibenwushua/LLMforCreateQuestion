<template>
  <div id="message">
    <div class="title"></div>
    <div class="wrapper">
      <div class="title1">
        <el-input
            placeholder="留言标题"
            v-model="title"
            clearable>
        </el-input>
      </div>
      <div class="content">
        <el-input
            type="textarea"
            :rows="3"
            placeholder="留言内容"
            v-model="content"
            clearable>
        </el-input>
      </div>
      <div class="btn">
        <el-button type="primary" @click="submit">提交留言</el-button>
      </div>
      <div class="all">
        <ul class="msglist">
          <li
              class="list"
              @mouseenter="enter(index)"
              @mouseleave="leave(index)"
              v-for="(data, index) in msg"
              :key="index"
          >
            <p class="title"><i class="iconfont icon-untitled33"></i>{{ data.title }}</p>
            <p class="content">{{ data.content }}</p>
            <p class="date"><i class="iconfont icon-date"></i>{{ data.time }}</p>
            <div v-for="(replayData, index2) in data.replays" :key="index2">
              <p class="comment"><i class="iconfont icon-huifuxiaoxi"></i>{{ replayData.replay }}</p>
            </div>
            <span class="replay" @click="replay(data.id)" v-if="flag && index === current">回复</span>
          </li>
        </ul>
      </div>
      <div class="pagination">
        <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="pagination.current"
            :page-sizes="[5, 10, 20, 50]"
            :page-size="pagination.size"
            layout="total, sizes, prev, pager, next, jumper"
            :total="pagination.total">
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { ElMessage, ElMessageBox } from 'element-plus';

export default {
  name: 'MessagePage',
  setup() {
    // 响应式数据
    const flag = ref(false);
    const current = ref(0);
    const title = ref('');
    const content = ref('');
    const pagination = ref({
      current: 1,
      total: null,
      size: 4,
    });
    const msg = ref([]);

    // 获取留言列表
    const getMsg = async () => {
      try {
        const res = await axios.get(`/api/messages/${pagination.value.current}/${pagination.value.size}`);
        if (res.data.code === 200) {
          msg.value = res.data.data.records;
          pagination.value = res.data.data;
        }
      } catch (error) {
        console.error('获取留言失败:', error);
      }
    };

    // 改变每页条数
    const handleSizeChange = (val) => {
      pagination.value.size = val;
      getMsg();
    };

    // 改变当前页码
    const handleCurrentChange = (val) => {
      pagination.value.current = val;
      getMsg();
    };

    // 提交留言
    const submit = async () => {
      const date = new Date();
      if (title.value.length === 0 || content.value.length === 0) {
        ElMessage({
          type: 'error',
          message: '留言标题或内容不能为空',
        });
        return;
      }

      try {
        const res = await axios.post('/api/message', {
          title: title.value,
          content: content.value,
          time: date,
        });
        if (res.data.code === 200) {
          ElMessage({
            type: 'success',
            message: '留言成功',
          });
          title.value = '';
          content.value = '';
          getMsg();
        }
      } catch (error) {
        console.error('提交留言失败:', error);
      }
    };

    // 回复留言
    const replay = (messageId) => {
      ElMessageBox.prompt('回复留言', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^[\s\S]*.*[^\s][\s\S]*$/,
        inputErrorMessage: '回复不能为空',
      })
          .then(({ value }) => {
            const date = new Date();
            return axios.post('/api/replay', {
              replay: value,
              replayTime: date,
              messageId: messageId,
            });
          })
          .then(() => {
            ElMessage({
              type: 'success',
              message: '回复成功',
            });
            getMsg();
          })
          .catch(() => {
            ElMessage({
              type: 'info',
              message: '取消输入',
            });
          });
    };

    // 鼠标进入事件
    const enter = (index) => {
      flag.value = true;
      current.value = index;
    };

    // 鼠标离开事件
    const leave = (index) => {
      flag.value = false;
      current.value = index;
    };

    // 生命周期钩子
    onMounted(() => {
      getMsg();
    });

    return {
      flag,
      current,
      title,
      content,
      pagination,
      msg,
      getMsg,
      handleSizeChange,
      handleCurrentChange,
      submit,
      replay,
      enter,
      leave,
    };
  },
};
</script>

<style lang="scss" scoped>
.pagination {
  display: flex;
  justify-content: center;
}
#message {
  width: 980px;
  margin: 0 auto;
}
.title {
  margin: 20px;
}
.content {
  padding: 20px 0px;
}
#message .btn {
  padding-bottom: 20px;
}
#message .all {
  .date {
    color: rgb(80, 157, 202);
    line-height: 45px;
    font-size: 13px;
  }
  .list {
    background-color: #eee;
    padding: 10px;
    border-radius: 4px;
    margin: 10px 0px;
    position: relative;
    transition: all 0.3s ease;
    .title {
      color: #5f5f5f;
      margin: 0px;
      font-size: 13px;
      line-height: 30px;
    }
    .content {
      padding: 0px;
    }
    .icon-untitled33 {
      font-size: 13px;
      margin-right: 4px;
    }
    .icon-date {
      font-size: 13px;
      margin-right: 4px;
      color: rgb(80, 157, 202);
    }
    .replay {
      position: absolute;
      right: 30px;
      bottom: 15px;
      color: tomato;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .comment {
      margin: -7px 0px;
      padding-bottom: 12px;
      font-size: 13px;
      color: #28b2b4;
      i {
        margin-right: 4px;
      }
    }
  }
}
#message .wrapper {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
}
</style>