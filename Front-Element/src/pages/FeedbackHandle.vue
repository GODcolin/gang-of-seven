<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>

    <el-main>
      <div class="content-container">
        <div class="top">
          <!-- 步骤条 -->
          <el-steps :active="2" align-center>
            <el-step title="查看反馈申请" description="由相关人员查看反馈申请"></el-step>
            <el-step title="处理反馈" description="若反馈情况属实，则发起工单；否则驳回"></el-step>
          </el-steps>
        </div>
        <div class="bottom">
          <!-- 表格 -->
          <el-table :data="FeedbackHandleItem" style="width: 100%">
            <el-table-column prop="user.userName" label="反馈人员" width="100"/>
            <el-table-column prop="id" label="知识id" width="100"/>
<!--            <el-table-column prop="knowledge.title" label="知识标题"/>-->
            <el-table-column label="知识标题">
              <template v-slot="scope" #default>
                <el-button type="text" @click="showKnowledge(scope.row)">{{ scope.row.knowledge.title }}</el-button>
              </template>
            </el-table-column>
            <el-table-column prop="content" label="反馈内容"/>
            <el-table-column prop="type" label="反馈类型" width="150"/>
            <el-table-column prop="feedbackTime" label="反馈时间" sortable/>
            <el-table-column prop="operation" label="操作" width="150">
              <template v-slot="scope" #default>
                <el-button type="text" size="small" @click="showFeedbackHandleForm(scope.row)">反馈审核</el-button>
              </template>
            </el-table-column>
          </el-table>
          <!-- 分页 -->
          <div class="block" style="float: right;bottom: 0">
            <el-pagination
                v-model:currentPage="current_page"
                :page-sizes="[5, 10, 15, 20]"
                :page-size="limit"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total"
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
            >
            </el-pagination>
          </div>
          <!-- 反馈审核表单 -->
          <el-dialog v-model="dialogFormVisible" title="反馈审核">
            <el-form :model="FeedbackHandleForm">
              <el-form-item label="知识id" :label-width="formLabelWidth">
                <el-input v-model="FeedbackHandleForm.id" disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="知识标题" :label-width="formLabelWidth">
                <el-input v-model="FeedbackHandleForm.knowledge.title" disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="反馈人员" :label-width="formLabelWidth">
                <el-input v-model="FeedbackHandleForm.user.userName" disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="反馈时间" :label-width="formLabelWidth">
                <el-input v-model="FeedbackHandleForm.feedbackTime" disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="反馈类型" :label-width="formLabelWidth">
                <el-input v-model="FeedbackHandleForm.type" disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="反馈内容" :label-width="formLabelWidth">
                <el-input v-model="FeedbackHandleForm.content" disabled="true"></el-input>
              </el-form-item>

            </el-form>
            <template #footer>
      <span class="dialog-footer">
        <el-button type="primary" @click="judgeAgree">通过</el-button>
        <el-button type="primary" @click="openReasonArea">驳回</el-button>
        <el-button type="disabled" @click="judgeDisagree">取消</el-button>
      </span>
            </template>

            <!--      <el-form-item label="驳回理由" v-if="showReasonArea" :label-width="formLabelWidth">-->
            <!--        <el-input type="textarea" v-model="FeedbackHandleForm.rejectReason" ></el-input>-->
            <!--        <el-button type="primary" @click="judgeDisagree(1)">确认</el-button>-->
            <!--        <el-button type="disabled" @click="judgeDisagree(2)">取消</el-button>-->
            <!--      </el-form-item>-->

          </el-dialog>

          <!-- 通过反馈后弹出抽屉 -->
          <!--  抽屉-->
          <el-drawer
              ref="drawerRef"
              v-model="ticketFlag"
              direction="rtl"
              custom-class="demo-drawer"
              size="45%"
          >
            <el-tabs v-model="activeName" @tab-click="handleClick">
              <!--        发起工单-->
              <el-tab-pane label="发起工单" name="first">
                <el-form :model="noticeForm" label-width="40px">
                  <el-form-item label="标题">
                    <el-input v-model="noticeForm.title"></el-input>
                  </el-form-item>
                  <el-form-item label="内容">
                    <el-input v-model="noticeForm.content" type="textarea"></el-input>
                  </el-form-item>
                  <el-form-item>
                    <el-button type="primary" @click="submitForm">确定</el-button>
                    <el-button @click="cancelForm">取消</el-button>
                  </el-form-item>
                </el-form>
              </el-tab-pane>

              <!--        发起历史-->
              <el-tab-pane label="发起历史" name="second" height="400px" @click="findHistory">
                <el-table :data="tableData" border>
                  <el-table-column prop="createTime" label="发起时间" width="100"/>
                  <el-table-column prop="title" label="标题" width="160"/>
                  <el-table-column prop="content" label="内容" width="300" height="40px"/>
                  <el-table-column prop="status" label="状态" width="90"/>
                </el-table>
              </el-tab-pane>
            </el-tabs>

          </el-drawer>
        </div>
      </div>
    </el-main>
  </el-container>

</template>

<script setup>
import axios from "axios";
import HomeHeadBar from "../components/HomeHeadBar.vue";
import {onBeforeMount, ref, reactive} from "vue";
import {useRouter} from 'vue-router'
import {ElMessageBox, ElMessage, ElDrawer} from "element-plus";
import baseUrl from "../utils/interface.js";
import dateUtil from "../utils/date.util";

const router = useRouter()
//表单 相关参数
let dialogFormVisible = ref(false)
let showReasonArea = ref(false)
const formLabelWidth = '120px'
//分页 相关参数
let current_page = ref(1)
let limit = ref(10)
let total = ref(10)
let pages = ref(1)
//反馈列表 相关参数
const FeedbackHandleItem = ref([{
  id: '',
  user: {userName: ''},
  knowledge: {title: ''},
  content: '',
  type: '',
  feedbackTime: '',
}])
//反馈处理表单 相关参数
const FeedbackHandleForm = reactive({
  content: '',
  feedbackTime: '',
  id: '',
  knowledge: {title: ''},
  type: '',
  user: {userName: ''},
  result: '',
  rejectReason: '',
})
//发起工单相关参数
const activeName = ref('first')
let ticketFlag = ref(false)
const noticeForm = ref({
  title: '',
  content: '',
})
const tableData = ref([{
  createTime: '',
  title: '',
  content: '',
  status: ''
}])
onBeforeMount( () => {
  show();
})
//
const show = () => {
  console.log("反馈处理列表")
  axios.get(`${baseUrl}/api/feedback/selectProcessingFeedback`).then(response => {
    //分页
    console.log("8888888", response);
    total.value = response.data.item.total;
    limit.value = response.data.item.limit;
    current_page.value = response.data.item.current_page;
    pages.value = response.data.item.pages;

    for (let i = 0; i < response.data.item.data.length; i++) {
      //时间转换
      let date = new Date(response.data.item.data[i].feedbackTime);
      response.data.item.data[i].feedbackTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
      //反馈处理列表中只显示待处理的！
      if (response.data.item.data[i].status === '0') {
        response.data.item.data[i].status = '待处理';
      } else if (response.data.item.data[i].status === '1') {
        response.data.item.data[i].status = '已通过';
      } else if (response.data.item.data[i].status === '2') {
        response.data.item.data[i].status = '驳回';
      }
    }

    FeedbackHandleItem.value = response.data.item.data
    // console.log(response.data.item.data)
  })
}
//进入处理页面
const showFeedbackHandleForm = (row) => {
  dialogFormVisible.value = true;
  console.log("弹出表单", dialogFormVisible.value, row.id)
  FeedbackHandleForm.id = row.id;
  FeedbackHandleForm.knowledge.title = row.knowledge.title;
  FeedbackHandleForm.user.userName = row.user.userName;
  FeedbackHandleForm.feedbackTime = row.feedbackTime;
  FeedbackHandleForm.type = row.type;
  FeedbackHandleForm.content = row.content;
}
const showKnowledge = (row) => {
  console.log('showKnowledge')
  console.log("id", row.knowledge.id)
  router.push({path: '/KnowledgeDetail', query: {id: row.knowledge.id}})
}
//审核通过
const judgeAgree = () => {
  console.log("审核通过111")
  axios.post(`${baseUrl}/api/feedback/update`, {flag: 1, id: FeedbackHandleForm.id})
  .then(() => {
    console.log("审核通过222")
    ElMessage({
      message: '确认反馈',
      type: 'success',
    })
    dialogFormVisible.value = false
    //  跳转到提交工单的界面
    console.log("跳转到提交工单的界面");
    ticketFlag.value = true;
    findHistory();
    show();
  })
}
//打开 填写驳回理由的弹窗
const openReasonArea = () => {
  ElMessageBox.prompt('请输入驳回理由', '驳回理由', {
    confirmButtonText: '确认并提交',
    cancelButtonText: '取消',
    inputPlaceholder: '请输入内容',
    // inputValidator: FeedbackHandleForm.rejectReason !== null,
    inputPattern: /\S/,
    inputErrorMessage: '您的提交为空，请重新填写并提交',
  }).then(({value}) => {
    console.log(value)
    FeedbackHandleForm.rejectReason = value;
    if (FeedbackHandleForm.rejectReason !== null) {
      axios.post(`${baseUrl}/api/feedback/update`, {
        flag: 0,
        reason: FeedbackHandleForm.rejectReason,
        id: FeedbackHandleForm.id,
      }).then(() => {
        dialogFormVisible.value = false;
        console.log("反馈审核不通过，确认驳回")
        ElMessage({
          message: '反馈审核不通过，确认驳回',
          type: 'success'
        })
        show();
        FeedbackHandleForm.rejectReason = ''
      })
    }
  }).catch(() => {
    ElMessage({
      type: 'info',
      message: '取消填写驳回理由',
    })
  })
}
//审核不通过
const judgeDisagree = () => {
  dialogFormVisible.value = false;
  ElMessage({
    message: '驳回已取消',
    type: 'info',
  })
  FeedbackHandleForm.rejectReason = ''
  showReasonArea.value = false;
}
// const handleClick = (tab: string, event: Event) => {
//   console.log(tab, event)
// }
//工单提交
const submitForm = () => {
  let info = {
    title: noticeForm.value.title,
    content: noticeForm.value.content
  };
  axios.post(`${baseUrl}/api/ticket/addTicket`, info)
  .then(() => {
        ticketFlag.value = false
        ElMessage({
          message: '创建工单成功',
          type: 'success',
        })
        noticeForm.value.title = '';
        noticeForm.value.content = '';
      }
  ).catch();
}
const cancelForm = () => {
  ticketFlag.value = false
  ElMessage({
    message: '已取消',
  })
}
const findHistory = () => {
  //获取发起历史的列表
  console.log("hurry")
  axios.get(`${baseUrl}/api/ticket/selectCreatedTicketByUserId`)
  .then((response) => {
    console.log("急急急", response)
    for (let i = 0; i < response.data.list.length; i++) {
      let aDate = new Date(response.data.list[i].createTime);
      response.data.list[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))

      if (response.data.list[i].status === "0") {
        response.data.list[i].status = '待审核'
      } else if (response.data.list[i].status === '1') {
        response.data.list[i].status = '未通过'
      } else {
        response.data.list[i].status = '已通过'
      }
    }
    tableData.value = response.data.list
  })
  .catch(function (err) {
    console.log(err)
  });
}

const handleSizeChange = async (val) => {
  console.log(`${val} items per page`)
  limit.value = val;

  await axios.get(`${baseUrl}/api/feedback/selectProcessingFeedback`, {params: {limit: val}})
  .then(response => {
    console.log("98989切换limit", response.data.item);
    limit.value = response.data.item.limit;
    pages.value = response.data.item.pages;
    current_page.value = response.data.item.page;

    for (let i = 0; i < response.data.item.data.length; i++) {
      //时间转换
      let date = new Date(response.data.item.data[i].feedbackTime);
      response.data.item.data[i].feedbackTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
      //反馈处理列表中只显示待处理的！
      if (response.data.item.data[i].status === '0') {
        response.data.item.data[i].status = '待处理';
      }
    }

    FeedbackHandleItem.value = response.data.item.data
  })
}
const handleCurrentChange = async (val) => {
  console.log(`current page: ${val}`, limit.value)
  current_page.value = val;
  console.log(limit.value, pages.value, current_page.value);
  axios.get(`${baseUrl}/api/feedback/selectProcessingFeedback`, {params: {page: val, limit: limit.value}})
  .then(response => {
    console.log("56789切换current_page", response);
    current_page.value = response.data.item.current_page;

    for (let i = 0; i < response.data.item.data.length; i++) {
      //时间转换
      let date = new Date(response.data.item.data[i].feedbackTime);
      response.data.item.data[i].feedbackTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
      //反馈处理列表中只显示待处理的！
      if (response.data.item.data[i].status === '0') {
        response.data.item.data[i].status = '待处理';
      }
    }

    FeedbackHandleItem.value = response.data.item.data
  })
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