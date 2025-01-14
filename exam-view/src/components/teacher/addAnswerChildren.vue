// 添加题库
<template>
  <div class="add">
    <el-tabs v-model="activeName">
      <el-tab-pane name="first">
        <span slot="label"><i class="el-icon-circle-plus"></i>添加试题</span>
        <section class="append">
          <ul>
            <li>
              <span>题目类型:</span>
              <el-select v-model="optionValue" placeholder="请选择题型" class="w150">
                <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>
            </li>
            <!-- <li v-if="optionValue == '选择题'">
              <span>所属章节：</span>
              <el-input
                placeholder="请输入对应章节"
                v-model="postChange.section"
                class="w150"
                clearable
              >
              </el-input>
            </li>
            <li v-if="optionValue == '填空题'">
              <span>所属章节：</span>
              <el-input
                placeholder="请输入对应章节"
                v-model="postFill.section"
                class="w150"
                clearable
              >
              </el-input>
            </li>
            <li v-if="optionValue == '判断题'">
              <span>所属章节：</span>
              <el-input
                placeholder="请输入对应章节"
                v-model="postJudge.section"
                class="w150"
                clearable
              >
              </el-input>
            </li> -->
            <li v-if="optionValue == '选择题'">
              <span>难度等级:</span>
              <el-select v-model="postChange.level" placeholder="选择难度等级" class="w150">
                <el-option v-for="item in levels" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>
            </li>
            <li v-if="optionValue == '填空题'">
              <span>难度等级:</span>
              <el-select v-model="postFill.level" placeholder="选择难度等级" class="w150">
                <el-option v-for="item in levels" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>
            </li>
            <li v-if="optionValue == '判断题'">
              <span>难度等级:</span>
              <el-select v-model="postJudge.level" placeholder="选择难度等级" class="w150">
                <el-option v-for="item in levels" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>
            </li>
            <li v-if="optionValue == '选择题'">
              <span>正确选项:</span>
              <el-select v-model="postChange.rightAnswer" placeholder="选择正确答案" class="w150">
                <el-option v-for="item in rights" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>
            </li>
          </ul>
          <!-- 选择题部分 -->
          <div class="change" v-if="optionValue == '选择题'">
            <div class="title">
              <el-tag>题目:</el-tag><span></span>
              <el-input type="textarea" rows="4" v-model="postChange.question" placeholder="请输入题目内容" resize="none"
                class="answer">
              </el-input>
            </div>
            <div class="options">
              <ul>
                <li>
                  <el-tag type="success">A</el-tag>
                  <el-input placeholder="请输入选项A的内容" v-model="postChange.answerA" clearable="">
                  </el-input>
                </li>
                <li>
                  <el-tag type="success">B</el-tag>
                  <el-input placeholder="请输入选项B的内容" v-model="postChange.answerB" clearable="">
                  </el-input>
                </li>
                <li>
                  <el-tag type="success">C</el-tag>
                  <el-input placeholder="请输入选项C的内容" v-model="postChange.answerC" clearable="">
                  </el-input>
                </li>
                <li>
                  <el-tag type="success">D</el-tag>
                  <el-input placeholder="请输入选项D的内容" v-model="postChange.answerD" clearable="">
                  </el-input>
                </li>
              </ul>
            </div>
            <div class="title">
              <el-tag>解析:</el-tag><span></span>
              <el-input type="textarea" rows="4" v-model="postChange.analysis" placeholder="请输入答案解析" resize="none"
                class="answer">
              </el-input>
            </div>
            <div class="submit">
              <el-button type="primary" @click="changeSubmit()">立即添加</el-button>
            </div>
          </div>
          <!-- 填空题部分 -->
          <div class="change fill" v-if="optionValue == '填空题'">
            <div class="title">
              <el-tag>题目:</el-tag><span></span>
              <el-input type="textarea" rows="4" v-model="postFill.question" placeholder="请输入题目内容" resize="none"
                class="answer">
              </el-input>
            </div>
            <div class="fillAnswer">
              <el-tag>正确答案:</el-tag>
              <el-input v-model="postFill.answer"></el-input>
            </div>
            <div class="title analysis">
              <el-tag type="success">解析:</el-tag><span></span>
              <el-input type="textarea" rows="4" v-model="postFill.analysis" placeholder="请输入答案解析" resize="none"
                class="answer">
              </el-input>
            </div>
            <div class="submit">
              <el-button type="primary" @click="fillSubmit()">立即添加</el-button>
            </div>
          </div>
          <!-- 判断题 -->
          <div class="change judge" v-if="optionValue == '判断题'">
            <div class="title">
              <el-tag>题目:</el-tag><span></span>
              <el-input type="textarea" rows="4" v-model="postJudge.question" placeholder="请输入题目内容" resize="none"
                class="answer">
              </el-input>
            </div>
            <div class="judgeAnswer">
              <el-radio v-model="postJudge.answer" label="T">正确</el-radio>
              <el-radio v-model="postJudge.answer" label="F">错误</el-radio>
            </div>
            <div class="title">
              <el-tag>解析:</el-tag><span></span>
              <el-input type="textarea" rows="4" v-model="postJudge.analysis" placeholder="请输入答案解析" resize="none"
                class="answer">
              </el-input>
            </div>
            <div class="submit">
              <el-button type="primary" @click="judgeSubmit()">立即添加</el-button>
            </div>
          </div>
        </section>
      </el-tab-pane>
      <el-tab-pane name="second">
        <span slot="label"><i class="iconfont icon-daoru-tianchong"></i>自动组卷</span>
        <div class="box">
          <ul>
            <li>
              <span>选择题数量：</span>
              <el-input type="text" v-model="changeNumber"></el-input>
            </li>
            <li>
              <span>填空题数量：</span>
              <el-input type="text" v-model="fillNumber"></el-input>
            </li>
            <li>
              <span>判断题数量：</span>
              <el-input type="text" v-model="judgeNumber"></el-input>
            </li>
            <li>
              <el-button type="primary" @click="create()">立即组卷</el-button>
            </li>
          </ul>
        </div>
      </el-tab-pane>

      <!-- AI出题 -->
      <el-tab-pane name="third">
        <span slot="label"><i class="iconfont el-icon-s-opportunity"></i>AI出题</span>
        <div class="box">
          <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="问题描述">
              <el-input v-model="form.textInput" placeholder="请输入内容"></el-input>
            </el-form-item>
            <el-form-item label="考试科目">
              <el-select v-model="form.select" placeholder="请选择">
                <el-option label="机械设计" value="1"></el-option>
                <el-option label="计算机网络" value="2"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="题目类型">
              <el-select v-model="form.qType" placeholder="请选择">
                <el-option label="选择题" value="1"></el-option>
                <el-option label="填空题" value="2"></el-option>
                <el-option label="判断题" value="3"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="文件上传">
              <el-upload ref="upload" :action="uploadUrl" :on-success="handleSuccess" :on-error="handleError"
                :before-upload="handleBeforeUpload" :auto-upload="true" :limit="1">
                <el-button slot="trigger" type="primary">选择文件</el-button>
                <!-- <el-button style="margin-left: 10px;" type="success" @click="submitUpload">上传到服务器</el-button> -->
                <div slot="tip" class="el-upload__tip">按需上传一个文件</div>
              </el-upload>
            </el-form-item>
            <el-form-item>
              <el-button type="primary"  @click="onSubmit">提交</el-button>
            </el-form-item>
          </el-form>
        </div>
      </el-tab-pane>


    </el-tabs>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        textInput: '',
        select: '',
        qType: ''
      },
      uploadUrl: '/api/upload',
      uploadedFilePath: '',// 存储上传文件的路径
      changeNumber: null, //选择题出题数量
      fillNumber: null, //填空题出题数量
      judgeNumber: null, //判断题出题数量
      activeName: "first", //活动选项卡
      options: [
        //题库类型
        {
          value: "选择题",
          label: "选择题",
        },
        {
          value: "填空题",
          label: "填空题",
        },
        {
          value: "判断题",
          label: "判断题",
        },
      ],
      levels: [
        //难度等级
        {
          value: "1",
          label: "1",
        },
        {
          value: "2",
          label: "2",
        },
        {
          value: "3",
          label: "3",
        },
        {
          value: "4",
          label: "4",
        },
        {
          value: "5",
          label: "5",
        },
      ],
      rights: [
        //正确答案
        {
          value: "A",
          label: "A",
        },
        {
          value: "B",
          label: "B",
        },
        {
          value: "C",
          label: "C",
        },
        {
          value: "D",
          label: "D",
        },
      ],
      paperId: null,
      optionValue: "选择题", //题型选中值
      subject: "", //试卷名称用来接收路由参数
      postChange: {
        //选择题提交内容
        subject: "", //试卷名称
        level: "", //难度等级选中值
        rightAnswer: "", //正确答案选中值
        section: "", //对应章节
        question: "", //题目
        analysis: "", //解析
        answerA: "",
        answerB: "",
        answerC: "",
        answerD: "",
      },
      postFill: {
        //填空题提交内容
        subject: "", //试卷名称
        level: "", //难度等级选中值
        answer: "", //正确答案
        section: "", //对应章节
        question: "", //题目
        analysis: "", //解析
      },
      postJudge: {
        //判断题提交内容
        subject: "", //试卷名称
        level: "", //难度等级选中值
        answer: "", //正确答案
        section: "", //对应章节
        question: "", //题目
        analysis: "", //解析
      },
      postPaper: {
        //考试管理表对应字段
        paperId: null,
        questionType: null, // 试卷类型 1--选择题  2--填空题   3--判断题
        questionId: null,
      },
    };
  },
  created() {
    this.getParams();
  },
  methods: {
    handleBeforeUpload(file) {
      // 上传前的操作，可以用来做一些校验
      console.log('上传文件前的处理', file);
      return true;
    },
    submitUpload() {
      this.$refs.upload.submit(); // 触发文件上传
    },
    handleSuccess(response, file, fileList) {
      // 文件上传成功后的回调
      console.log('文件上传成功', response, file, fileList);
      this.uploadedFilePath = response; // 存储文件路径
    },
    handleError(err, file, fileList) {
      // 文件上传失败后的回调
      console.log('文件上传失败', err, file, fileList);
      this.$message.error('文件上传失败，请重试！');
    },
    onSubmit() {
      // 提交表单的处理逻辑
      // 提交表单的处理逻辑
       if (!this.form.textInput || !this.form.select || !this.form.qType) {
          this.$message.error('请先填写题目信息');
          return;
      }

      const form = this.form;
      const data = {
        description: form.textInput,
        subject: form.select,
        questionType: form.qType,
        filePath: this.uploadedFilePath
      };
      this.$axios.post('/api/llmSubmit', JSON.stringify(data), {
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(response => {
          this.$message.success('问题提交成功，继续添加题目或返回');
          this.form = {};
          this.form.filePath = ''; // 额外清空 filePath
        // 清空文件上传组件中的文件
          this.$refs.upload.clearFiles();
          console.log('问题提交成功', response.data);
        })
        .catch(error => {
          this.$message.error('问题提交失败，请重试！');
          console.error('问题提交失败', error);
        });
    },
    create() {
      this.$axios({
        url: "/api/item",
        method: "post",
        data: {
          changeNumber: this.changeNumber,
          fillNumber: this.fillNumber,
          judgeNumber: this.judgeNumber,
          paperId: this.paperId,
          subject: this.subject,
        },
      }).then((res) => {
        let data = res.data;
        if (data.code == 200) {
          setTimeout(() => {
            this.$router.push({ path: "/selectAnswer" });
          }, 1000);
          this.$message({
            message: data.message,
            type: "success",
          });
        } else if (data.code == 400) {
          this.$message({
            message: data.message,
            type: "error",
          });
        }
      });
    },
    getParams() {
      let subject = this.$route.query.subject; //获取试卷名称
      let paperId = this.$route.query.paperId; //获取paperId
      this.paperId = paperId;
      this.subject = subject;
      this.postPaper.paperId = paperId;
    },
    changeSubmit() {
      //选择题题库提交
      this.postChange.subject = this.subject;
      this.$axios({
        //提交数据到选择题题库表
        url: "/api/MultiQuestion",
        method: "post",
        data: {
          ...this.postChange,
        },
      })
        .then((res) => {
          //添加成功显示提示
          let status = res.data.code;
          if (status == 200) {
            this.$message({
              message: "已添加到题库",
              type: "success",
            });
            this.postChange = {
              //选择题提交内容
              subject: "", //试卷名称
              level: "", //难度等级选中值
              rightAnswer: "", //正确答案选中值
              section: "", //对应章节
              question: "", //题目
              analysis: "", //解析
              answerA: "",
              answerB: "",
              answerC: "",
              answerD: "",
            };
          }
        })
        .then(() => {
          this.$axios(`/api/multiQuestionId`).then((res) => {
            //获取当前题目的questionId
            let questionId = res.data.data.questionId;
            this.postPaper.questionId = questionId;
            this.postPaper.questionType = 1;
            this.$axios({
              url: "/api/paperManage",
              method: "Post",
              data: {
                ...this.postPaper,
              },
            });
          });
        });
    },
    fillSubmit() {
      //填空题提交
      this.postFill.subject = this.subject;
      this.$axios({
        url: "/api/fillQuestion",
        method: "post",
        data: {
          ...this.postFill,
        },
      })
        .then((res) => {
          let status = res.data.code;
          if (status == 200) {
            this.$message({
              message: "已添加到题库",
              type: "success",
            });
            this.postFill = {
              //填空题提交内容
              subject: "", //试卷名称
              level: "", //难度等级选中值
              answer: "", //正确答案
              section: "", //对应章节
              question: "", //题目
              analysis: "", //解析
            };
          }
        })
        .then(() => {
          this.$axios(`/api/fillQuestionId`).then((res) => {
            //获取当前题目的questionId
            let questionId = res.data.data.questionId;
            this.postPaper.questionId = questionId;
            this.postPaper.questionType = 2;
            this.$axios({
              url: "/api/paperManage",
              method: "Post",
              data: {
                ...this.postPaper,
              },
            });
          });
        });
    },
    judgeSubmit() {
      //判断题提交
      this.postJudge.subject = this.subject;
      this.$axios({
        url: "/api/judgeQuestion",
        method: "post",
        data: {
          ...this.postJudge,
        },
      })
        .then((res) => {
          let status = res.data.code;
          if (status == 200) {
            this.$message({
              message: "已添加到题库",
              type: "success",
            });
            this.postJudge = {
              //判断题提交内容
              subject: "", //试卷名称
              level: "", //难度等级选中值
              answer: "", //正确答案
              section: "", //对应章节
              question: "", //题目
              analysis: "", //解析
            };
          }
        })
        .then(() => {
          this.$axios(`/api/judgeQuestionId`).then((res) => {
            //获取当前题目的questionId
            let questionId = res.data.data.questionId;
            this.postPaper.questionId = questionId;
            this.postPaper.questionType = 3;
            this.$axios({
              url: "/api/paperManage",
              method: "Post",
              data: {
                ...this.postPaper,
              },
            });
          });
        });
    },
  },
};
</script>

<style lang="less" scoped>
.add {
  margin: 0px 40px;

  .box {
    padding: 0px 20px;

    ul li {
      margin: 10px 0px;
      display: flex;
      align-items: center;

      .el-input {
        width: 6%;
      }

      .w150 {
        margin-left: 20px;
        width: 7%;
      }
    }
  }

  .el-icon-circle-plus {
    margin-right: 10px;
  }

  .icon-daoru-tianchong {
    margin-right: 10px;
  }

  .append {
    margin: 0px 20px;

    ul {
      display: flex;
      align-items: center;

      li {
        margin-right: 20px;
      }
    }

    .change {
      margin-top: 20px;
      padding: 20px 16px;
      background-color: #e7f6f6;
      border-radius: 4px;

      .title {
        padding-left: 6px;
        color: #2f4f4f;

        span:nth-child(1) {
          margin-right: 6px;
        }

        .answer {
          margin: 20px 0px 20px 8px;
        }

        .el-textarea {
          width: 98% !important;
        }
      }

      .options {
        ul {
          display: flex;
          flex-direction: column;
        }

        ul li {
          display: flex;
          justify-content: center;
          align-items: center;
          width: 98%;
          margin: 10px 0px;

          span {
            margin-right: 20px;
          }
        }
      }

      .submit {
        display: flex;
        justify-content: center;
        align-items: center;
      }
    }

    .fill {
      .fillAnswer {
        display: flex;
        justify-content: center;
        align-items: center;

        span {
          margin-right: 6px;
        }

        .el-input {
          width: 91% !important;
        }
      }

      .analysis {
        margin-top: 20px;
        margin-left: 5px;
      }
    }

    .judge {
      .judgeAnswer {
        margin-left: 20px;
        margin-bottom: 20px;
      }
    }

    .w150 {
      width: 150px;
    }

    li:nth-child(2) {
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }
}
</style>
