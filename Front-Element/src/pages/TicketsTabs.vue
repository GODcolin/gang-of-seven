<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>

    <el-main>
      <div class="content-container">
        <el-tabs style="padding: 2%;width: 96%">
          <!--      工单审核   -->
          <el-tab-pane label="工单审核" v-if="this.hasPerms('business:ticket:audit')">
            <!--        审核列表-->
            <el-table :data="ticketsJudgeTable" border height="500" style="width: 100%">
              <el-table-column prop="id" label="工单编号" width="90"/>
              <el-table-column prop="title" label="标题" width="300"/>
              <el-table-column prop="content" label="内容" width="400" height="40px"></el-table-column>
              <el-table-column prop="creator.userName" label="创建者" width="100"/>
              <el-table-column prop="createTime" label="创建时间" width="200"/>
              <el-table-column label="操作" width="100">
                <!--            插槽-->
                <template v-slot="scope" #default>
                  <el-button type="text" size="small" @click="this.passJudge(scope.row)">通过</el-button>
                  <el-button type="text" size="small" @click="this.rejectJudgeForm(scope.row)">驳回</el-button>
                </template>
              </el-table-column>
            </el-table>
            <!--        审核弹窗-->
            <el-dialog v-model="this.judgeFormFlag" title="驳回审核">
              <el-form label-width="120px">
                <el-form-item label="理由">
                  <el-input type="textarea" v-model="this.reason"></el-input>
                  <el-button type="primary" @click="this.rejectJudge(1)">确认</el-button>
                  <el-button type="disabled" @click="this.rejectJudge(2)">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog>
          </el-tab-pane>

          <!--      工单列表   -->
          <el-tab-pane label="工单列表" v-if="this.hasPerms('business:ticket:query')">
            <el-table :data="ticketsTable" border height="500" style="width: 100%">
              <el-table-column prop="id" label="工单编号" width="90"/>
              <el-table-column prop="title" label="标题" width="300"/>
              <el-table-column prop="content" label="内容" width="400"/>
              <el-table-column prop="creator.userName" label="创建者" width="90"/>
              <el-table-column prop="createTime" label="创建时间" width="200"/>
              <el-table-column fixed="right" label="操作" width="100">
                <template v-slot="scope" #default>
                  <el-button type="text" size="small" @click="receiveTicket(scope.row)">接单</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>

          <!--     我的接单  -->
          <el-tab-pane label="我的接单" v-if="this.hasPerms('business:ticket:query')">
            <el-table :data="myTicketsTable" border height="500" style="width: 100%">
              <el-table-column prop="id" label="工单编号" width="90"/>
              <el-table-column prop="title" label="标题" width="200"/>
              <el-table-column prop="content" label="内容" width="340" height="50px"/>
              <el-table-column prop="receiveTime" label="接单时间" width="210"/>
              <el-table-column prop="finishTime" label="完成时间" width="210"/>
              <el-table-column prop="status" label="状态" width="90"/>
              <el-table-column prop="creator.userName" label="创建者" width="90"/>
              <el-table-column fixed="right" label="操作" width="80">
                <template v-slot="scope" #default>
                  <el-button type="text" size="small" :disabled=" scope.row.status!=='已接单'"
                             @click="finishFun(scope.row) ">
                    完成
                  </el-button>
                </template>
              </el-table-column>
            </el-table>

            <!--弹窗-->
            <el-dialog v-model="this.finishFlag" title="完成我的接单">
              <el-form label-width="120px" :inline="true">
                <el-form-item label="完成采编的知识">
                  <el-input v-model="this.finishTitle" placeholder="请输入关键词搜索"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-icon @click="searchByKeyWords">
                    <search/>
                  </el-icon>
                </el-form-item>
              </el-form>

              <el-table :data="selectResultData" height="500" style="width: 100%">
                <el-table-column prop="id" label="编号" width="90"/>
                <el-table-column prop="title" label="标题" width="200"/>
                <el-table-column prop="classification.categoryName" label="类别" width="100"/>
                <el-table-column prop="time" label="创建时间" width="200"/>
                <el-table-column fixed="right" label="操作" width="100">
                  <template v-slot="scope" #default>
                    <el-button type="text" size="small" @click="submitFinish(scope.row)">完成</el-button>
                    <el-button type="text" size="small" @click="cancelFinish">取消</el-button>
                  </template>
                </el-table-column>
              </el-table>
            </el-dialog>

          </el-tab-pane>

          <!--      工单完成审核   -->
          <el-tab-pane label="工单完成审核" v-if="this.hasPerms('business:ticket:audit')">
            <!--        审核列表-->
            <el-table :data="ticketsFinishJudgeTable" border height="500" style="width: 100%">
              <el-table-column prop="id" label="工单编号" width="90"/>
              <el-table-column prop="title" label="标题" width="200"/>
              <el-table-column prop="content" label="内容" width="330"/>
              <el-table-column prop="receiver.userName" label="接单者" width="90"/>
              <el-table-column prop="finishTime" label="完成时间" width="200"/>
              <el-table-column prop="knowledgeId" label="知识编号" width="90"/>
              <el-table-column fixed="right" label="操作" width="200">
                <template v-slot="scope" #default>
                  <el-button type="text" size="small" @click="this.knowledgeDetail(scope.row)">知识详情</el-button>
                  <el-button type="text" size="small" @click="this.passFinishJudge(scope.row)">通过</el-button>
                  <el-button type="text" size="small" @click="this.rejectFinishJudgeForm(scope.row)">驳回</el-button>
                </template>
              </el-table-column>
            </el-table>
            <!--        审核弹窗-->
            <el-dialog v-model="this.judgeFinishFormFlag" title="驳回审核">
              <el-form label-width="120px">
                <el-form-item label="理由">
                  <el-input type="textarea" v-model="this.finishReason"></el-input>
                  <el-button type="primary" @click="rejectFinishJudge(1)">确认</el-button>
                  <el-button type="disabled" @click="rejectFinishJudge(2)">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog>
          </el-tab-pane>

        </el-tabs>
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
import store from "../plugins/store";
import {hasPermission} from "../plugins/permission";

export default {
  name: "TicketsTabs",
  components: {HomeHeadBar},
  data() {
    return {

      finishFlag: false,//显示完成表单
      showReasonArea: false,//显示原因输入框
      judgeFormFlag: false,//显示审核表单
      judgeFinishFormFlag: false,

      judgeFlag: null,//审核是否通过 1 0
      reason: '',//审核原因
      finishReason: '',//审核完成原因

      globalId: null,//审核通过的id 驳回的id
      globalFinishTicketId: null,//完成工单的id

      finishTitle: '',
      judgeTicketsForm: {
        title: '',
        createTime: '',
        content: ''
      },
      // 工单审核列表----------------------------------------------
      ticketsJudgeTable: [
        {
          id: '1',
          createTime: '2016-05-03',
          title: '套餐升级业务已经过时',
          creator: {}
        }
      ],
      //工单列表------------------------------------------------
      ticketsTable: [{
        id: 1,
        title: '王小虎',
        content: '上海市普陀区金沙江路 1518 弄',
        creator: {},
        createTime: '2016-05-02'
      }],
      //我的接单------------------------------------------
      myTicketsTable: [{
        id: '1',
        title: '王小虎',
        content: '上海市普陀区金沙江路 1518 弄',
        receiveTime: '2016-05-03',
        finishTime: '2016-05-03',
        creator: {},
        status: '1'
      }],
      //完成工单审核列表---------------------------------
      ticketsFinishJudgeTable: [{
        id: 1,
        title: '嗡嗡嗡嗡嗡嗡',
        content: '哇哇哇哇哇哇哇嗡嗡嗡嗡嗡嗡',
        receiver: {},
        finishTime: '2022-1-13',
        knowledgeId: 2
      }],
      //知识搜索结果列表----------------------------------------
      selectResultData: [{
        id: 1,
        title: '111111',
        classification: {},
        time: ''
      }]

    }
  },
  methods: {
    //加载工单审核列表---------------------------------------------------------
    autoLoad1() {
      axios.get(`${baseUrl}/api/ticket/selectAuditingTickets`)
      .then((response) => {
        for (let i = 0; i < response.data.item.data.length; i++) {
          //时间转换
          let aDate = new Date(response.data.item.data[i].createTime);
          response.data.item.data[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
        }
        this.ticketsJudgeTable = response.data.item.data;

      }).catch(function (err) {
        console.log(err)
      });
    },
    //加载工单列表---------------------------------------------------------
    autoLoad2() {
      axios.get(`${baseUrl}/api/ticket/selectToReceiveTickets`)
      .then((response) => {
        for (let i = 0; i < response.data.item.data.length; i++) {
          let aDate = new Date(response.data.item.data[i].createTime);
          response.data.item.data[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
        }
        this.ticketsTable = response.data.item.data;
      })
      .catch(function (err) {
        console.log(err)
      });
    },
    //加载我的接单列表----------------------------------------------------
    autoLoad3() {
      axios.get(`${baseUrl}/api/ticket/selectUserTickets`)
      .then((response) => {
        for (let i = 0; i < response.data.item.data.length; i++) {
          let aDate = new Date(response.data.item.data[i].receiveTime);
          response.data.item.data[i].receiveTime = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))

          let bDate = new Date(response.data.item.data[i].finishTime);
          response.data.item.data[i].finishTime = dateUtil.toChineseString(dateUtil.UTCToLocal(bDate))

          if (response.data.item.data[i].status === '3') {
            response.data.item.data[i].status = '已接单';
            response.data.item.data[i].finishTime = null
          } else if (response.data.item.data[i].status === '4')
            response.data.item.data[i].status = '已完成'
          else {
            response.data.item.data[i].status = '关闭'
          }
        }
        this.myTicketsTable = response.data.item.data
      }).catch(function (err) {
        console.log(err)
      });
    },
    //加载审核完成工单的列表----------------------------------------------
    autoLoad4() {
      axios.get(`${baseUrl}/api/ticket/selectFinishedTickets`).then((response) => {
        for (let i = 0; i < response.data.item.data.length; i++) {
          let aDate = new Date(response.data.item.data[i].finishTime);
          response.data.item.data[i].finishTime = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
        }
        this.ticketsFinishJudgeTable = response.data.item.data;
      }).catch(function (err) {
        console.log(err)
      });
    },
    //1-----通过审核------------------------------------------------------------
    passJudge(row) {
      console.log(row.id);
      axios.post(`${baseUrl}/api/ticket/audit`, {flag: 1, id: row.id})
      .then(() => {
        this.autoLoad1();
        this.autoLoad2();
        this.autoLoad3();
        this.autoLoad4()
        ElMessage({
          message: "通过审核",
          type: "success"
        })
      }).catch(
          function (err) {
            console.log(err)
          }
      );
    },
    //1----驳回审核----------------------------------------------------------
    rejectJudgeForm(row) {
      this.judgeFormFlag = true
      this.globalId = row.id
    },
    rejectJudge(val) {
      if (val === 1) {
        axios.post(`${baseUrl}/api/ticket/audit`, {flag: 0, id: this.globalId, reason: this.reason})
        .then(() => {
          this.autoLoad1();
          this.autoLoad2();
          this.autoLoad3();
          this.autoLoad4()
          ElMessage({
            message: "驳回",
            type: "success"
          })
          this.judgeFormFlag = false
        }).catch(
            function (err) {
              console.log(err)
            }
        );
      } else {
        this.judgeFormFlag = false
        ElMessage({
          message: "取消",
        })
      }

    },
    //2-----接单--------------------------------------------------------------------
    receiveTicket(row) {
      axios.post(`${baseUrl}/api/ticket/receive`, {id: row.id})
      .then(() => {
        this.autoLoad1();
        this.autoLoad2();
        this.autoLoad3();
        this.autoLoad4()
        ElMessage({
          message: "已接单",
          type: "success"
        })
      })
      .catch(function (err) {
        console.log(err)
      });
    },
    //3-----打开完成表单------------------------------------------------------
    finishFun(row) {
      this.finishFlag = true
      this.globalFinishTicketId = row.id
      axios.get(`${baseUrl}/api/knowledge/selectAuditedKnowledge`).then(
          (response) => {
            this.autoLoad1();
            this.autoLoad2();
            this.autoLoad3();
            this.autoLoad4()
            for (let i = 0; i < response.data.item.data.length; i++) {
              let aDate = new Date(response.data.item.data[i].time);
              response.data.item.data[i].time = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate))
            }
            this.selectResultData = response.data.item.data
          }
      ).catch(function (err) {
        console.log(err)
      });

    },
    //3----搜索------------------------------------------------------------
    searchByKeyWords() {
      axios.get(`${baseUrl}/api/knowledge/selectAuditedKnowledge`, {params: {title: this.finishTitle}})
      .then(
          (response) => {
            this.autoLoad1();
            this.autoLoad2();
            this.autoLoad3();
            this.autoLoad4()
            this.selectResultData = response.data
          }
      ).catch(function (err) {
        console.log(err)
      });
    },
    //3-----提交完成----------------------------------------------------------
    submitFinish(row) {
      axios.post(`${baseUrl}/api/ticket/finish`, {
        ticketId: this.globalFinishTicketId,
        knowledgeId: row.id
      }).then(() => {
        this.autoLoad1();
        this.autoLoad2();
        this.autoLoad3();
        this.autoLoad4()
        this.finishFlag = false
        ElMessage({
          message: "已完成",
          type: "success"
        })
      }).catch(function (err) {
        console.log(err)
      });
    },
    //3-----取消完成-----------------------------------------------------------
    cancelFinish() {
      this.autoLoad1();
      this.autoLoad2();
      this.autoLoad3();
      this.autoLoad4()
      this.finishFlag = false
      ElMessage({
        message: "操作取消",
      })
    },
    //4----进入详情----------------------------------------------------------
    knowledgeDetail(row) {
      //row.id
      this.$router.push({path: '/KnowledgeDetail', query: {id: row.knowledgeId}});
    },
    //4-----通过审核-----------------------------------------------------------todo
    passFinishJudge(row) {
      axios.post(`${baseUrl}/api/ticket/close`, {flag: 1, id: row.id})
      .then(() => {
        this.autoLoad1();
        this.autoLoad2();
        this.autoLoad3();
        this.autoLoad4()
        ElMessage({
          message: "已审核",
          type: "success"
        })
      })
      .catch(function (err) {
        console.log(err)
      });
    },
    //4-----驳回审核----------------------------------------------------------
    rejectFinishJudgeForm(row) {
      this.judgeFinishFormFlag = true
      this.globalFinishTicketId = row.id
    },
    //4-----驳回审核-----------------------------------------------------------todo
    rejectFinishJudge(val) {
      if (val === 1) {
        axios.post(`${baseUrl}/api/ticket/close`,
            {flag: 0, id: this.globalFinishTicketId, reason: this.finishReason})
        .then(() => {
          this.autoLoad1();
          this.autoLoad2();
          this.autoLoad3();
          this.autoLoad4()
          this.judgeFinishFormFlag = false;
          ElMessage({
            message: "已驳回",
            type: "success"
          })
        })
        .catch(function (err) {
          console.log(err)
        });
      } else {
        this.judgeFinishFormFlag = false;
        ElMessage({
          message: "已取消",
        })
      }
    },
    getPermission() {
      axios.get(`${baseUrl}/api/auth/getInfo`).then((response) => {
            console.log("权限庞倩倩1--------")
            console.log(response.data.item)
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

    },
  },
  mounted() {
    this.autoLoad1();
    this.autoLoad2();
    this.autoLoad3();
    this.autoLoad4();
    this.getPermission();
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
</style>
