<template>

  <div class="banner">
    <div class="Head">
      <router-link to='Home'><img class="img1" src="../assets/电信logo.png" alt=""></router-link>

      <el-button type="text" class="buttonStyle">
        <router-link to='/CollectFormPage'>
          <span v-if="hasPerms('business:knowledge:add')">知识采编</span>
        </router-link>
      </el-button>


      <el-button type="text" class="buttonStyle">
        <router-link to='/KnowledgeJudgeList'>
          <span v-if="hasPerms('business:knowledge:audit')">知识审核</span>
        </router-link>
      </el-button>

      <el-button type="text" class="buttonStyle">
        <router-link to='/FeedbackHandle'>
          <span v-if="hasPerms('business:feedback:audit')">反馈处理</span>
        </router-link>
      </el-button>


      <el-input class="input-search" v-model="input" placeholder="请输入搜索内容" @keyup.enter.native="search(input)"/>


      <el-button icon="Search" circle @click="search(input)" plain class="searchStyle">
      </el-button>


      <el-button type="text" class="buttonStyle">
        <router-link to='/HighLevelSearch'>
          <span>高级搜索</span>
        </router-link>
      </el-button>

      <el-button type="text" class="buttonStyle">
        <router-link to='/TicketsTabs'>
          <span
              v-if="hasPerms('business:knowledge:add')||hasPerms('business:ticket:audit') ">工单
          </span>
        </router-link>
      </el-button>

      <el-button type="text" @click="this.ticketFlag=true" class="buttonStyle">
        <span v-if="hasPerms('business:ticket:add')">创建工单</span>
      </el-button>

      <el-button icon="Message" circle plain class="messageStyle"></el-button>

      <div class="pictureStyle">
        <el-dropdown>
          <router-link to='/HomePage'>
            <el-avatar :src="this.avatar" size="small"></el-avatar>
          </router-link>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item disabled>用户名@{{ this.nickname }}</el-dropdown-item>
              <el-dropdown-item @click="goToPersonalCenter">
                <el-icon>
                  <avatar/>
                </el-icon>
                个人中心
              </el-dropdown-item>
              <el-dropdown-item @click="goToSetting">
                <el-icon>
                  <setting/>
                </el-icon>
                设置
              </el-dropdown-item>
              <el-dropdown-item @click="LogOut"><el-icon><switch-button /></el-icon>退出账号</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div>
  </div>


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
          <el-table-column prop="createTime" label="发起时间" width="130"/>
          <el-table-column prop="title" label="标题" width="140"/>
          <el-table-column prop="content" label="内容" width="300" height="40px"/>
          <el-table-column prop="status" label="状态" width="80"/>
        </el-table>
      </el-tab-pane>
    </el-tabs>

  </el-drawer>

</template>

<script lang="ts">
import {ref, onBeforeMount} from 'vue'
import {useRouter} from 'vue-router'
import {useStore} from 'vuex'
import axios from "axios";
import {ElDrawer, ElMessage} from "element-plus";
import authService from '../services/auth.service.js'
import baseUrl from "../utils/interface.js";
import dateUtil from "../utils/date.util";
import {hasPermission} from '../plugins/permission'
import store from '../plugins/store.js'

export default {
  name: "HomeHeadBar",
  props: ['username'],
  data() {
    return {
      flag: true,
      ticketFlag: false,
      noticeForm: {
        title: '',
        content: '',
      },
      tableData: [
        {
          createTime: '',
          title: '',
          content: '',
          status: ''
        }
      ]
    }
  },
  setup(props) {
    const store = useStore()
    const input = ref(store.state.searchComment)
    // store.getters.getUserInfo.nickname
    const nickname = ref(JSON.parse(localStorage.getItem('userInfo')).nickname)
    const avatar = ref(JSON.parse(localStorage.getItem('avatar')))
    console.log("2222", avatar)
    const username = ref('')
    const router = useRouter()
    let timer
    const loading = ref(false)
    const activeName = ref('first')
    const drawerRef = ref<InstanceType<typeof ElDrawer>>()
    onBeforeMount(() => {
      axios.get(`${baseUrl}/api/user/getUser`)
          .then((response) => {
            console.log("qiuqiule", response.data.avatar);
            avatar.value = response.data.avatar;
            store.commit("setAvatar", response.data.avatar);
          })
    })
    const onClick = () => {
      drawerRef.value!.close()
    }
    const handleClick = (tab: string, event: Event) => {
      console.log(tab, event)
    }
    const search = (input) => {
      store.state.searchComment = input
      console.log(input)
      if (input !== '') {
        console.log("进入到路由")
        router.push({
          name: 'SearchResult',
          query: {title: input}
        })
      } else {
        ElMessage({
          message: '请输入搜索内容',
          type: 'error',
        })
      }
    }
    const LogOut = () => {
      authService.logout()
      store.state.searchComment = ''
      router.push({
        name: 'Login',
      })
    }
    const goToSetting = () => {
      router.push({
        name: 'setting'
      })
    }
    const goToPersonalCenter = () => {
      router.push({
        name: 'PersonalCenter'
      })
    }
    return {
      search,
      LogOut,
      goToSetting,
      goToPersonalCenter,
      input,
      avatar,
      nickname,
      username: props.username,
      timer,
      loading,
      activeName,
      onClick,
      handleClick
    }
  },
  methods: {
    //创建工单---------------------------------------------------------
    submitForm() {
      let info = {
        title: this.noticeForm.title,
        content: this.noticeForm.content
      };
      axios.post(`${baseUrl}/api/ticket/addTicket`, info)
          .then(() => {
                this.ticketFlag = false
                ElMessage({
                  message: '创建工单成功',
                  type: 'success',
                })
            this.clearForm()
            this.findHistory();
              }
          ).catch();
    },
    cancelForm() {
      this.ticketFlag = false
      ElMessage({
        message: '已取消',
      })
    },
    findHistory() {
      //获取发起历史的列表
      axios.get(`${baseUrl}/api/ticket/selectCreatedTicketByUserId`)
          .then((response) => {
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
            this.tableData = response.data.list
          })
          .catch(function (err) {
            console.log(err)
          });
    },
    clearForm() {
      this.noticeForm.title = ''
      this.noticeForm.content = ''
    },
    getPermission() {
      axios.get(`${baseUrl}/api/auth/getInfo`).then((response) => {
            let perms = response.data.item;
            store.dispatch("SET_PERMISSION", perms);
          }
      ).catch(function (err) {
        console.log(err)
      });

    },
    hasPerms: function (perms) {
      // 根据权限标识和外部指示状态进行权限判断
      return hasPermission(perms)
    }
  },
  mounted() {
    this.findHistory();
    this.getPermission();
  }
}
</script>

<style scoped>
.banner {
  width: 100%;
  background-color: white;
}

.Head {
  display: flex;
  height: 60px;
  align-items: center;
  width: 1300px;
  margin: auto;
  justify-content: center;

}

.input-search {
  flex: auto;
  width: 170px;
  height: 50px;
  margin-top: 17px;
  margin-left: 40px;
}

.img1 {
  flex: auto;
  width: 220px;
  height: 60px;
}

.buttonStyle {
  flex: auto;
  color: #1B1B1B;
}

.searchStyle {
  margin: 10px;
}

.messageStyle {
  margin: 30px;
}

.pictureStyle {
  flex: 0 1 auto;
}

a {
  text-decoration: none;
  color: black;
}

a:active {
  color: blue;
}

a:hover {
  color: blue;
  text-decoration: underline;
}
</style>
