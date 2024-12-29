<template>
  <div class="table">
    <p class="title"></p>
    <section class="content">
      <el-table ref="filterTable" :data="score" v-loading="loading">
        <el-table-column
            prop="answerDate"
            label="考试日期"
            sortable
            width="300"
            column-key="answerDate"
            :filters="filter"
            :filter-method="filterHandler">
        </el-table-column>
        <el-table-column
            prop="subject"
            label="课程名称"
            width="300"
            filter-placement="bottom-end">
          <template #default="scope">
            <el-tag>{{ scope.row.subject }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="etScore" label="考试分数" width="200"></el-table-column>
        <el-table-column label="是否及格" width="100">
          <template #default="scope">
            <el-tag :type="scope.row.etScore >= 60 ? 'success' : 'danger'">
              {{ scope.row.etScore >= 60 ? "及格" : "不及格" }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
    </section>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useCookies } from 'vue3-cookies';

export default {
  name: 'StudentScore',
  setup() {
    const { cookies } = useCookies();

    // 响应式数据
    const loading = ref(false);
    const score = ref([]);
    const filter = ref([]);

    // 获取学生成绩
    const getScore = async () => {
      const studentId = cookies.get('cid');
      try {
        const res = await axios.get(`/api/score/${studentId}`);
        if (res.data.code === 200) {
          score.value = res.data.data;
          loading.value = false; // 数据加载完成去掉遮罩

          // 生成过滤参数
          const mapVal = score.value.map((element) => ({
            text: element.answerDate,
            value: element.answerDate,
          }));

          // 去重操作
          const hash = {};
          filter.value = mapVal.reduce((acc, next) => {
            if (!hash[next.text]) {
              hash[next.text] = true;
              acc.push(next);
            }
            return acc;
          }, []);
        }
      } catch (error) {
        console.error('获取成绩失败:', error);
      }
    };

    // 过滤方法
    const filterHandler = (value, row, column) => {
      const property = column.property;
      return row[property] === value;
    };

    // 生命周期钩子
    onMounted(() => {
      loading.value = true; // 数据加载时遮罩表格
      getScore();
    });

    return {
      loading,
      score,
      filter,
      filterHandler,
    };
  },
};
</script>

<style lang="scss" scoped>
.table {
  width: 1000px;
  margin: 0 auto;
  .title {
    margin: 20px;
  }
  .content {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
  }
}
</style>