<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>
    <el-main>
      <div class="content-container">
        <div class="top">
          <el-steps :active="2">
            <el-step title="采编" :icon="Edit"></el-step>
            <el-step title="审核" :icon="Upload"></el-step>
            <el-step title="发布" :icon="SuccessFilled"></el-step>
          </el-steps>
        </div>
        <div class="bottom">
          <!--  表格-->
          <el-table :data="tableData" stripe border max-height="550px" @row-click="showJudgeFormFun">
            <el-table-column prop="id" label="编号" min-width="10"></el-table-column>

            <el-table-column prop="author" label="发布者" min-width="20"></el-table-column>

            <el-table-column prop="title" label="标题" min-width="50"></el-table-column>

            <el-table-column prop="classification.categoryName" label="类别" min-width="15"></el-table-column>

            <el-table-column prop="time" label="创建时间" min-width="20"></el-table-column>

            <el-table-column fixed="right" label="操作" width="200">
              <template v-slot="scope" #default>
                <el-button type="text" size="small" @click="showJudgeFormFun(scope.row)">进入审核</el-button>
              </template>

            </el-table-column>

          </el-table>
          <!--  分页-->
          <div class="block" style="float: right;bottom: 0">
            <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                v-model:current-page="this.current_page"
                :page-sizes="[5, 10, 15,20]"
                :page-size="this.limit"
                layout="total, jumper, prev, pager, next, sizes"
                :total="this.total">
            </el-pagination>
            <!-- （弹框）知识审核表单-->
            <el-dialog v-model="dialogFormVisible" title="知识审核">
              <el-form label-position="left" :model="judgeForm" label-width="80px" disabled>
                <el-form-item label="标题" disabled="true">
                  <el-input v-model="judgeForm.title"></el-input>
                </el-form-item>

                <el-form-item label="作者" disabled="true">
                  <el-input v-model="judgeForm.author"></el-input>
                </el-form-item>

                <el-form-item label="关键词" disabled="true">
                  <el-input v-model="judgeForm.keywords"></el-input>
                </el-form-item>

                <el-form-item label="分类" disabled="true">
                  <el-input v-model="judgeForm.category"></el-input>
                </el-form-item>

                <el-form-item label="知识渠道" disabled="true">
                  <el-input v-model="judgeForm.source"></el-input>
                </el-form-item>

                <el-form-item label="发布部门" disabled="true">
                  <el-input v-model="judgeForm.area"></el-input>
                </el-form-item>

                <el-form-item label="创建时间" disabled="true">
                  <el-input v-model="judgeForm.createTime"></el-input>
                </el-form-item>

                <el-form-item label="有效时间" disabled="true">
                  <el-input v-model="judgeForm.lifeTime"></el-input>
                </el-form-item>
              </el-form>
              <td>内容</td>
              <div disabled="true" v-html="this.judgeForm.content"></div>

              <div style="text-align: right">
                <el-button type="primary" @click="this.judgeAgree">审核通过</el-button>
                <el-button type="disabled" @click="showReasonArea=true">驳回申请</el-button>
              </div>

              <el-form-item label="理由" v-if="showReasonArea">
                <el-input type="textarea" v-model="this.rejectReason"></el-input>
                <el-button type="primary" @click="this.judgeDisagree(1)">确认</el-button>
                <el-button type="disabled" @click="this.judgeDisagree(2)">取消</el-button>
              </el-form-item>

            </el-dialog>
          </div>
        </div>
      </div>
    </el-main>
  </el-container>

</template>

<script>
import axios from "axios";
import HomeHeadBar from "../components/HomeHeadBar.vue";
import {ElMessage} from "element-plus";
import baseUrl from "../utils/interface.js";
import dateUtil from "../utils/date.util";
import {ref} from 'vue'

const loading = ref(true)
export default {
  components: {HomeHeadBar},
  data() {
    return {
      loading: true,
      rejectReason: '',
      total: 5,
      pages: 5,
      current_page: 1,  //默认第一页
      limit: 5, //默认展示5条数据
      showJudgeForm: false,
      dialogFormVisible: false,
      showReasonArea: false,
      currKnowledgeId: '',
      tableData: [{
        author: '',
        title: '',
        classification: {},
        time: '',
        id: null
      }],
      judgeForm: {
        title: '',
        author: '',
        keywords: '',
        category: '',
        source: '',
        area: '',
        createTime: '',
        lifeTime: '',
        content: '',
      }
    }
  },
  methods: {
    //获取审核列表------------------------------------------------------------------------
    findTable() {
      //根据用户的id get审核列表
      axios.get(`${baseUrl}/api/knowledge/findAuditingKnowledge`)
      .then((response) => {
        console.log("审核列表----------------------");
        console.log(response.data.item.data);
        //分页赋值
        this.total = response.data.item.total;
        this.current_page = response.data.item.current_page;
        this.limit = response.data.item.limit;
        // 时间转换
        // let aDate = new Date(response.data.list[i].createTime);
        // response.data.list[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
        for (let i = 0; i < response.data.item.data.length; ++i) {
          let aDate = new Date(response.data.item.data[i].time);
          let localDate = dateUtil.UTCToLocal(aDate)
          response.data.item.data[i].time = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))

        }
        this.tableData = response.data.item.data;
        console.log(this.tableData)
      })
      .catch(function (err) {
        console.log(err);
      });
    },
    // 进入审核界面-----------------------------------------------------------------(获得当前的currKnowledgeId
    showJudgeFormFun(row) {
      this.dialogFormVisible = true;
      this.currKnowledgeId = row.id;
      console.log(row.id);
      axios.get(`${baseUrl}/api/knowledge/findByKnowledgeId`, {
        params: {
          id: row.id
        }
      }).then((response) => {
        console.log(response);
        this.judgeForm.title = response.data.item.title;


        let aDate = new Date(response.data.item.createTime);
        response.data.item.createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
        this.judgeForm.createTime = response.data.item.createTime

        let bDate = new Date(response.data.item.lifeTime);
        response.data.item.lifeTime = dateUtil.toChineseString(dateUtil.UTCToLocal(bDate))
        this.judgeForm.lifeTime = response.data.item.lifeTime

        this.judgeForm.category = response.data.item.category.categoryName;
        this.judgeForm.keywords = response.data.item.tags[0].tagName;
        this.judgeForm.source = response.data.item.source.name;
        this.judgeForm.content = response.data.item.content;
        this.judgeForm.area = response.data.item.depts[0].deptName;

        this.judgeForm.author = response.data.item.user.authorName;
      }).catch(function (err) {
        console.log(err);
      });
    },
    //审核通过---------------------------------------------------------------------
    judgeAgree() {
      this.dialogFormVisible = false;
      axios.post(`${baseUrl}/api/audit/addKnowledgeAudit`,
          {
            flag: 1,
            knowledgeId: this.currKnowledgeId
          })
      .then(() => {
        this.findTable()
        console.log("审核通过")
        ElMessage({
          message: '审核通过已确认',
          type: 'success',
        })
      })

      .catch(function (error) {
        console.log(error);
      });
    },
    //驳回审核---------------------------------------------------------------------
    judgeDisagree(val) {
      if (val === 1) {
        if (this.rejectReason !== '') {
          axios.post(`${baseUrl}/api/audit/addKnowledgeAudit`,
              {
                flag: 0,
                rejectReason: this.rejectReason,
                knowledgeId: this.currKnowledgeId
              })
          .then(() => {
                this.findTable()
                ElMessage({
                  message: '驳回已确认',
                  type: 'success',
                })
                this.dialogFormVisible = false;
              }
          )
          .catch(function (error) {
            console.log(error);
          });
        } else {
          ElMessage({
            message: '请填写理由',
          })
        }
      } else {
        this.dialogFormVisible = false;
        ElMessage({
          message: '驳回已取消',
          type: 'success',
        })
      }
    },
    //分页处理函数
    handleSizeChange(val) {
      this.limit = val;
    },
    handleCurrentChange(val) {
      this.current_page = val;
    },
  },
  mounted() {
    this.findTable()
  },
  watch: {
    current_page() {
      console.log("current_page改变-----------------------------")
      console.log(this.current_page)
      axios.get(`${baseUrl}/api/knowledge/findAuditingKnowledge`, {
        params: {
          page: this.current_page,
          limit: this.limit
        }
      }).then((response) => {
        //分页赋值
        this.pages = response.data.item.pages;
        //时间转换
        for (let i = 0; i < response.data.item.data.length; ++i) {
          let aDate = new Date(response.data.item.data[i].time);
          response.data.item.data[i].time = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
        }
        alert('Current Page Wtch')
        this.tableData = response.data.item.data;
      }).catch(function (err) {
        console.log(err);
      });
    },
    limit() {
      console.log("limit改变-----------------------------")
      axios.get(`${baseUrl}/api/knowledge/findAuditingKnowledge`, {
        params: {
          current_page: this.current_page,
          limit: this.limit
        }
      }).then((response) => {
        //分页赋值
        this.pages = response.data.item.pages;
        this.current_page = response.data.item.current_page;
        this.limit = response.data.item.limit;
        //时间转换
        for (let i = 0; i < response.data.item.data.length; ++i) {
          let aDate = new Date(response.data.item.data[i].time);
          response.data.item.data[i].time = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
        }
        this.tableData = response.data.item.data;
      }).catch(function (err) {
        console.log(err);
      });
    }
  }
}
</script>

<style scoped>
.el-header {
  padding: 0;
}

.el-main {
  padding: 0;
}

.content-container {
  display: flex;
  width: 1300px;
  margin: 10px auto;
  justify-content: center;
  align-items: flex-start;
  background-color: white;
  flex: auto;
  flex-flow: column nowrap;
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.top {
  padding: 2%;
  flex: auto;
  width: 96%;
  height: auto;
}

.bottom {
  padding: 2%;
  flex: auto;
  width: 96%;
  height: auto;
}
</style>

