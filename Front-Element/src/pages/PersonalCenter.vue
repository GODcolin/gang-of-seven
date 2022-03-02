<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>

    <el-main>
      <div class="content-container">
        <div class="left">
          <el-row class="tac">
            <el-col>
              <el-menu default-active="2" class="el-menu-vertical-demo" style="height: 600px">
                <el-menu-item index="1" @click="selectMenu('1');showdata()">个人资料</el-menu-item>
                <el-menu-item index="3" @click="selectMenu('3');showfeedback()">我的反馈</el-menu-item>
              </el-menu>
            </el-col>
          </el-row>
        </div>
        <div class="right">
          <!-- 个人资料 -->
          <div v-if="menuIndex === '1'">
            <el-row class="demo-avatar demo-basic">
              <el-col :span="12">
                <div style="margin-top: 10%">
                  <el-avatar :size="200" :src="form.avatar"></el-avatar>
                </div>
                <div style="margin-top: 5%">
                  <el-form ref="formRef" :model="form" label-width="120px">
                    <el-form-item label="昵称">
                      <el-input :disabled="disability" v-model="form.nickname"></el-input>
                    </el-form-item>
                    <el-form-item label="性别">
                      <el-input :disabled="disability" v-model="form.sex"></el-input>
                    </el-form-item>
                    <el-form-item label="联系方式">
                      <el-input :disabled="disability" v-model="form.phonenumber"></el-input>
                    </el-form-item>

                    <el-form-item label="邮箱">
                      <el-input :disabled="disability" v-model="form.email" type="textarea"></el-input>
                    </el-form-item>

                    <el-form-item>
                      <el-button type="primary" @click="onSubmit">提交修改</el-button>
                      <el-button @click="cancelSubmit">取消修改</el-button>
                    </el-form-item>
                  </el-form>
                </div>
              </el-col>
            </el-row>
          </div>

          <!-- 我的反馈 -->
          <div v-if="menuIndex === '3'">
            <el-table :data="FeedbackItem" :default-sort="{ prop: 'date', order: 'descending' }" style="width: 100%">
              <el-table-column prop="feedbackTime" label="反馈时间" sortable width="200"/>
              <el-table-column prop="handler.userName" label="反馈人员" width="150"/>
              <el-table-column prop="knowledge.title" label="标题"/>
              <el-table-column prop="status" label="反馈状态"/>
              <el-table-column prop="content" label="反馈内容"/>
            </el-table>
          </div>
          <div class="demo-pagination-block" v-if="menuIndex === '3'">
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

        </div>
      </div>
    </el-main>
  </el-container>

</template>

<script setup>
import HomeHeadBar from "../components/HomeHeadBar.vue";
import axios from "axios";
import {ref, onBeforeMount} from "vue";
import baseUrl from "../utils/interface.js";
import dateUtil from "../utils/date.util";
import {useStore} from "vuex";
import {ElMessage} from "element-plus";

const store = useStore()

let menuIndex = ref('1')
let selectMenu = (index) => {
  menuIndex.value = index
}
let current_page = ref(1)
let limit = ref(10)
let total = ref(10)
let pages = ref(1)
let disability = ref(false)

onBeforeMount(() => {
      showdata()
    }
)
const FeedbackItem = ref([{
  feedbackTime: '',
  handler: {userName: ''},
  knowledge: {title: ''},
  status: '',
  content: '',
}])
const form = ref([{
  avatar: '',
  nickname: '',
  sex: '',
  phonenumber: '',
  //  department: '',
  // remark: '',
  email: '',
}])
const showdata = () => {
  console.log("显示userId", store.state.userId)
  axios.get(`${baseUrl}/api/user/getUser`)
  .then(response => {
    form.value = response.data
    if (form.value.sex === "0") form.value.sex = '男';
    else if (form.value.sex === "1") form.value.sex = '女';
    console.log("打印response.data", response.data)
    console.log("打印form.value", form.value)
  })
}
const onSubmit = () => {
  let newSexvalue;
  if (form.value.sex === '男') {
    newSexvalue = 0;
  } else if (form.value.sex === '女') {
    newSexvalue = 1;
  }
  let newName = form.value.nickname;
  let newPhone = form.value.phonenumber;
  let newEmail = form.value.email;
  console.log("newxxx", newName, newPhone, newEmail);
  axios.post(`${baseUrl}/api/user/update`, {nickname: newName, sex: newSexvalue, phonenumber: newPhone, email: newEmail}).then(
      response => {
        showdata();
        ElMessage({
          message: '以成功修改个人资料',
          type: 'success',
        })
      }
  )
}
const cancelSubmit = () => {
  showdata();
  ElMessage({
    message: '已取消修改个人资料',
    type: 'info',
  })
}
const showfeedback = async () => {
  console.log("反馈")
  await axios.get(`${baseUrl}/api/feedback/findUserFeedback`)
  .then(response => {
    // console.log("111111111", response.data.list)
    console.log(response.data.item)
    total.value = response.data.item.total;
    limit.value = response.data.item.limit;
    current_page.value = response.data.item.current_page;
    pages.value = response.data.item.pages;

    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].feedbackTime);
      response.data.item.data[i].feedbackTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
      FeedbackItem.value = response.data.item.data;
      if (response.data.item.data[i].status === '0') {
        response.data.item.data[i].status = '待处理';
      } else if (response.data.item.data[i].status === '1') {
        response.data.item.data[i].status = '反馈已接收';
      } else {
        response.data.item.data[i].status = '反馈被驳回';
      }
    }
  })
}
const handleSizeChange = async (val) => {
  console.log(`${val} items per page`)
  limit.value = val;

  await axios.get(`${baseUrl}/api/feedback/findUserFeedback`, {params: {limit: val}})
  .then(response => {
    console.log("98989切换limit", response.data.item);
    limit.value = response.data.item.limit;
    pages.value = response.data.item.pages;
    current_page.value = response.data.item.page;

    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].feedbackTime);
      response.data.item.data[i].feedbackTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
      FeedbackItem.value = response.data.item.data;
      if (response.data.item.data[i].status === '0') {
        response.data.item.data[i].status = '待处理';
      } else if (response.data.item.data[i].status === '1') {
        response.data.item.data[i].status = '反馈已接收';
      } else {
        response.data.item.data[i].status = '反馈被驳回';
      }
    }
  })
}
const handleCurrentChange = async (val) => {
  console.log(`current page: ${val}`, limit.value)
  current_page.value = val;
  console.log(limit.value, pages.value, current_page.value);
  await axios.get(`${baseUrl}/api/feedback/findUserFeedback`, {params: {page: val, limit: limit.value}})
  .then(response => {
    console.log("56565切换current_page", response.data.item);
    current_page.value = response.data.item.current_page;

    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].feedbackTime);
      response.data.item.data[i].feedbackTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
      FeedbackItem.value = response.data.item.data;
      if (response.data.item.data[i].status === '0') {
        response.data.item.data[i].status = '待处理';
      } else if (response.data.item.data[i].status === '1') {
        response.data.item.data[i].status = '反馈已接收';
      } else {
        response.data.item.data[i].status = '反馈被驳回';
      }
    }
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
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.left {
  flex: auto;
  width: 300px;
  display: flex;
  flex-flow: column nowrap;
  padding-left: 5%;
  padding-top: 5%;
}

.right {
  flex: auto;
  width: 1000px;
  display: flex;
  flex-flow: column nowrap;
  text-align: center;
  padding: 5%;
}

a {
  text-decoration: none;
}

</style>