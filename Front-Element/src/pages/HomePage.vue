<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>

    <el-main>
      <div class="content-container">
        <div class="content-left">
          <div class="leftHead">
            <div class="img">
              <el-avatar :size="200" :src="Information.avatar"></el-avatar>
            </div>
            <br>
          </div>
          <div class="leftBody">
            <el-icon>
              <avatar/>
            </el-icon>
            <p>昵称：{{ Information.nickname }}</p><br>
            <p>联系方式：{{ Information.phonenumber }}</p><br>
            <p>邮箱：{{ Information.email }}</p><br>
          </div>
        </div>
        <div class="content-right">
          <div class="rightMenu">
            <el-menu
                active-text-color="#fff"
                background-color="#c8e0c8"
                :default-active="activeIndex"
                class="el-menu-demo"
                mode="horizontal"
                @select="handleSelect"
            >
              <el-sub-menu index="release" @click="selectMenu('1');showrelease()"
                           v-if="hasPerms('business:knowledge:individual:query')">

                <template #title>
                  <el-icon>
                    <bell-filled/>
                  </el-icon>
                  我的发布
                </template>
                <el-menu-item index="released" @click="selectMenu('1-1');showreleased()">
                  <el-icon>
                    <circle-check/>
                  </el-icon>
                  已发布
                </el-menu-item>
                <el-menu-item index="pending" @click="selectMenu('1-2');showpending()">
                  <el-icon>
                    <loading/>
                  </el-icon>
                  待审核
                </el-menu-item>
                <el-menu-item index="draft" @click="selectMenu('1-3');showdraft()">
                  <el-icon>
                    <edit/>
                  </el-icon>
                  草稿箱
                </el-menu-item>
                <el-menu-item index="rejected" @click="selectMenu('1-4');showrejected()">
                  <el-icon>
                    <circle-close/>
                  </el-icon>
                  未通过
                </el-menu-item>
              </el-sub-menu>
              <el-menu-item index="collection" @click="selectMenu('2');showcollection()">
                <el-icon>
                  <star-filled/>
                </el-icon>
                我的收藏
              </el-menu-item>
              <el-menu-item index="star" @click="selectMenu('3');showstar()">
                <el-icon>
                  <promotion/>
                </el-icon>
                我的点赞
              </el-menu-item>
              <el-menu-item index="comment" @click="selectMenu('4');showcomment()">
                <el-icon>
                  <comment/>
                </el-icon>
                我的评论
              </el-menu-item>
              <el-menu-item index="history" @click="selectMenu('5');showhistory()">
                <el-icon>
                  <opportunity/>
                </el-icon>
                浏览历史
              </el-menu-item>
            </el-menu>
          </div>
          <div class="rightBody">
            <!-- 我的发布 -->
            <div>
              <el-table :data="ReleaseItem" v-if="menuIndex === '1'" border style="width: 100%"
                        :default-sort="{ prop: 'createTime', order: 'descending' }">
                <el-table-column label="创建时间" sortable width="200" :sort-method="sortByDate">
                  <template v-slot="scope" #default>
                    {{ scope.row.createTime }}
                  </template>
                </el-table-column>
                <el-table-column prop="knowledgeId" label="知识id" width="70"/>
                <el-table-column prop="title" label="知识标题"/>
                <el-table-column prop="categoryName" label="知识分类" width="130"/>
                <el-table-column prop="status" label="状态" width="90"/>
                <el-table-column fixed="right" label="操作" width="100">
                  <template v-slot="scope" #default>
                    <el-button type="text" @click="doedit(scope.row)">编辑</el-button>
                    <el-button type="text" @click="dodelete(scope.row)">删除</el-button>
                  </template>
                </el-table-column>
              </el-table>
            </div>
            <!-- 已发布 -->
            <div>
              <el-table :data="ReleasedItem" v-if="menuIndex === '1-1'" border style="width: 100%"
                        :default-sort="{ prop: 'createTime', order: 'descending' }">
                <el-table-column prop="createTime" label="发布时间" sortable width="200" :sort-method="sortByDate"/>
                <el-table-column prop="knowledgeId" label="知识id" width="70"/>
                <el-table-column prop="title" label="知识标题"/>
                <el-table-column prop="categoryName" label="知识分类" width="130"/>
                <el-table-column prop="viewCounts" label="浏览量" width="100" sortable/>
                <el-table-column fixed="right" label="操作" width="120">
                  <template v-slot="scope" #default>
                    <el-button type="text" @click="showKnowledge(scope.row)">查看知识详情</el-button>
                  </template>
                </el-table-column>
              </el-table>
            </div>
            <!-- 待审核 -->
            <div>
              <el-table :data="PendingItem" v-if="menuIndex === '1-2'" border style="width: 100%"
                        :default-sort="{ prop: 'createTime', order: 'descending' }">
                <el-table-column prop="createTime" label="提交时间" width="200" sortable :sort-method="sortByDate"/>
                <el-table-column prop="knowledgeId" label="知识id" width="70"/>
                <el-table-column prop="title" label="知识标题"/>
                <el-table-column prop="categoryName" label="知识分类"/>
              </el-table>
            </div>
            <!-- 草稿箱 -->
            <div>
              <el-table :data="DraftItem" v-if="menuIndex === '1-3'"
                        :default-sort="{ prop: 'title', order: 'descending' }" style="width: 100%">
                <el-table-column prop="createTime" label="创建时间" width="200" sortable :sort-method="sortByDate"/>
                <el-table-column prop="knowledgeId" label="知识id" width="70"/>
                <el-table-column prop="title" label="草稿标题"/>
                <el-table-column prop="categoryName" label="草稿分类"/>
                <el-table-column prop="operation" label="操作">
                  <template v-slot="scope" #default>
                    <el-button type="text" size="large" @click="doedit(scope.row)">编辑草稿</el-button>
                  </template>
                </el-table-column>
              </el-table>
            </div>
            <!-- 未通过 -->
            <div>
              <el-table :data="RejectedItem" v-if="menuIndex === '1-4'" border style="width: 100%"
                        :default-sort="{ prop: 'createTime', order: 'descending' }">
                <el-table-column prop="createTime" label="审核时间" width="200" sortable/>
                <el-table-column prop="knowledgeId" label="知识id" width="70"/>
                <el-table-column prop="title" label="知识标题"/>
                <el-table-column prop="categoryName" label="知识分类"/>
                <el-table-column fixed="right" label="操作">
                  <template v-slot="scope" #default>
                    <el-button type="text" @click="doedit(scope.row)">编辑</el-button>
                  </template>
                </el-table-column>
              </el-table>
            </div>
            <!-- 我的收藏 -->
            <div>
              <el-table :data="CollectionItem" v-if="menuIndex === '2'" border style="width: 100%"
                        :default-sort="{ prop: 'collectTime', order: 'descending' }">
                <el-table-column prop="collectTime" label="收藏时间" width="200" sortable/>
                <el-table-column fixed="right" label="知识标题">
                  <template v-slot="scope" #default>
                    <el-button type="text" @click="showKnowledge(scope.row)"><span
                        style="color:#556e46;">{{ scope.row.knowledgeTitle }}</span></el-button>
                  </template>
                </el-table-column>
              </el-table>
            </div>
            <!-- 我的点赞 -->
            <div>
              <el-table :data="StarItem" v-if="menuIndex === '3'" style="width: 100%"
                        :default-sort="{ prop: 'likesTime', order: 'descending' }">
                <el-table-column prop="likesTime" label="点赞时间" width="200" sortable/>
                <el-table-column fixed="right" label="知识标题">
                  <template v-slot="scope" #default>
                    <el-button type="text" @click="showKnowledge(scope.row)"><span
                        style="color:#556e46;">{{ scope.row.knowledgeTitle }}</span></el-button>
                  </template>
                </el-table-column>
                <el-table-column prop="knowledgeAuthor" label="知识作者" width="100"/>
              </el-table>
            </div>
            <!-- 我的评论 -->
            <div>
              <el-table :data="CommentItem" v-if="menuIndex === '4'" border style="width: 100%"
                        :default-sort="{ prop: 'commentTime', order: 'descending' }">
                <el-table-column label="评论时间" width="200" sortable>
                  <template v-slot="scope" #default>
                    {{ scope.row.commentTime }}
                  </template>
                </el-table-column>
                <el-table-column fixed="right" label="知识标题">
                  <template v-slot="scope" #default>
                    <el-button type="text" @click="showKnowledge(scope.row)"><span
                        style="color:#556e46;">{{ scope.row.knowledgeTitle }}</span></el-button>
                  </template>
                </el-table-column>
                <el-table-column prop="commentContent" label="评论内容"/>
              </el-table>
            </div>
            <!-- 浏览历史 -->
            <div>
              <el-table :data="HistoryItem" v-if="menuIndex === '5'" border style="width: 100%"
                        :default-sort="{ prop: 'viewTime', order: 'descending' }">
                <el-table-column prop="viewTime" label="浏览时间" width="200" sortable/>
                <el-table-column fixed="right" label="知识标题">
                  <template v-slot="scope" #default>
                    <el-button type="text" @click="showKnowledge(scope.row)"><span
                        style="color:#556e46;">{{ scope.row.knowledgeTitle }}</span></el-button>
                  </template>
                </el-table-column>
              </el-table>
            </div>
          </div>
          <div class="demo-pagination-block">
            <el-pagination
                style="float: right"
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
  <keep-alive
      :include="['Release', 'Released', 'Pending', 'Draft', 'Rejected', 'Collection', 'History', 'Comment', 'Star']">
  </keep-alive>
</template>

<script setup>
import axios from "axios";
import {onBeforeMount, ref} from "vue";
import {useRoute, useRouter} from 'vue-router'
import {
  Avatar,
  BellFilled,
  StarFilled,
  Promotion,
  Opportunity,
  Comment,
  CircleCheck,
  Loading,
  Edit,
  CircleClose
} from '@element-plus/icons'
import HomeHeadBar from "../components/HomeHeadBar.vue";
import baseUrl from "../utils/interface.js";
import dateUtil from "../utils/date.util";
import {useStore} from "vuex";
import {hasPermission} from "../plugins/permission";

const store = useStore()
const route = useRoute()
const router = useRouter()

let menuIndex = ref('2')
let selectMenu = (index) => {
  console.log("当前", index)
  menuIndex.value = index
}
let current_page = ref(1)
let limit = ref(10)
let total = ref(10)
let pages = ref(1)

const Information = ref({
  avatar: '',
  nickName: '',
  sex: '',
  phonenumber: '',
  remark: '',
  email: '',
})
const ReleaseItem = ref([{
  createTime: '',
  knowledgeId: '',
  title: '',
  status: '',
  categoryName: '',
}])
const ReleasedItem = ref([{
  createTime: '',
  knowledgeId: '',
  title: '',
  categoryName: '',
  viewCounts: '',
}])
const PendingItem = ref([{
  createTime: '',
  title: '',
  categoryName: '',
}])
const DraftItem = ref([{
  createTime: '',
  title: '',
  categoryName: '',
}])
const RejectedItem = ref([{
  createTime: '',
  title: '',
  categoryName: '',
}])
const CollectionItem = ref([{
  knowledgeTitle: '',
  collectTime: '',
}])
const StarItem = ref([{
  knowledgeTitle: '',
  knowledgeAuthor: '',
  likesTime: '',
}])
const CommentItem = ref([{
  knowledgeTitle: '',
  commentContent: '',
  commentTime: '',
}])
const HistoryItem = ref([{
  knowledgeTitle: '',
  viewTime: ''
}])
const editItem = ref({
  title: '',
  tags: [],
  category: {categoryName: ''},
  // share:'',
  // notice:'',
  depts: [{deptName: ''}],
  source: {name: ''},
  lifeTime: '',
  content: "",
})
onBeforeMount(() => {
  axios.get(`${baseUrl}/api/user/getUser`)
      .then((response) => {
        Information.value = response.data;
      })
  showcollection()
})

const showrelease = () => {
  axios.get(`${baseUrl}/api/userWorks/findAllWorksById`)
  .then(response => {
    total.value = response.data.item.total;
    limit.value = response.data.item.limit;
    current_page.value = response.data.item.current_page;
    pages.value = response.data.item.pages;
    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].createTime);
      response.data.item.data[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))

      if (response.data.item.data[i].status === '0') {
        response.data.item.data[i].status = '草稿';
      } else if (response.data.item.data[i].status === '1') {
        response.data.item.data[i].status = '待审核';
      } else if (response.data.item.data[i].status === '2') {
        response.data.item.data[i].status = '已发布';
      } else {
        response.data.item.data[i].status = '审核不通过';
      }
    }
    ReleaseItem.value = response.data.item.data;
    console.log(response.data.item)
  })
}
const showreleased = () => {
  axios.get(`${baseUrl}/api/userWorks/findPassWorksByUserId`)
  .then(response => {
    showdata(response);
    ReleasedItem.value = response.data.item.data
    console.log(response.data.item.data)
  })
  console.log("已发布")
}
const showpending = () => {
  axios.get(`${baseUrl}/api/userWorks/findAuditingWorksByUserId`)
  .then(response => {
    showdata(response);
    PendingItem.value = response.data.item.data
    console.log(response.data.item.data)
  })
  console.log("待审核")
}
const showdraft = () => {
  axios.get(`${baseUrl}/api/userWorks/findDraftByUserId`)
  .then(response => {
    showdata(response);
    DraftItem.value = response.data.item.data
    console.log(response.data.item.data)
  })
  console.log("草稿箱")
}
const showrejected = () => {
  axios.get(`${baseUrl}/api/userWorks/findFailWorksByUserId`)
  .then(response => {
    showdata(response);
    RejectedItem.value = response.data.item.data
    console.log(response.data.item.data)
  })
  console.log("已拒绝")
}
const showcollection = () => {
  axios.get(`${baseUrl}/api/collection/findUserCollection`)
  .then(response => {
    total.value = response.data.item.total;
    limit.value = response.data.item.limit;
    current_page.value = response.data.item.current_page;
    pages.value = response.data.item.pages;
    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].collectTime);
      response.data.item.data[i].collectTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
    }
    CollectionItem.value = response.data.item.data
    console.log(response.data.item.data)
  })
  console.log("我的收藏")
}
const showstar = () => {
  axios.get(`${baseUrl}/api/userLikes/findUserLikes`)
  .then(response => {
    total.value = response.data.item.total;
    limit.value = response.data.item.limit;
    current_page.value = response.data.item.current_page;
    pages.value = response.data.item.pages;
    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].likesTime);
      response.data.item.data[i].likesTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
    }
    StarItem.value = response.data.item.data
    console.log(response.data.item.data)
  })
  console.log("我的点赞")
}
const showcomment = () => {
  axios.get(`${baseUrl}/api/comment/findCommentByUserId`)
  .then(response => {
    console.log("6666", response)
    total.value = response.data.item.total;
    limit.value = response.data.item.limit;
    current_page.value = response.data.item.current_page;
    pages.value = response.data.item.pages;
    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].commentTime);
      response.data.item.data[i].commentTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
    }
    CommentItem.value = response.data.item.data
  })
  console.log("我的评论")
}
const showhistory = () => {
  axios.get(`${baseUrl}/api/viewHistory/selectViewHistoryById`)
  .then(response => {
    total.value = response.data.item.total;
    limit.value = response.data.item.limit;
    current_page.value = response.data.item.current_page;
    pages.value = response.data.item.pages;
    for (let i = 0; i < response.data.item.data.length; i++) {
      let date = new Date(response.data.item.data[i].viewTime);
      response.data.item.data[i].viewTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
    }
    HistoryItem.value = response.data.item.data
    console.log(response.data.item.data)
  })
  console.log("输出浏览历史")
}
const showdata = (response) => {
  total.value = response.data.item.total;
  limit.value = response.data.item.limit;
  current_page.value = response.data.item.current_page;
  pages.value = response.data.item.pages;
  for (let i = 0; i < response.data.item.data.length; i++) {
    let date = new Date(response.data.item.data[i].createTime);
    response.data.item.data[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
  }
}

//跳转到知识详情
const showKnowledge = (id) => {
  console.log('showKnowledge')
  console.log(id.knowledgeId)
  router.push({path: '/KnowledgeDetail', query: {id: id.knowledgeId}})
}
//跳转到采编
const doedit = (row) => {
  console.log('doedit')
  store.commit("setKnowledgeId", row.knowledgeId)
  router.push({path: '/CollectFormPage', query: {id: row.knowledgeId}})
}
const sortByDate = (row, row1) => {
  if (row.createTime < row1.createTime) return -1;
  else return 1;
}
const dodelete = (row) => {
  axios.delete(`${baseUrl}/api/knowledge/deleteKnowledgeById`, {params: {id: row.knowledgeId}})
  .then(() => {
    showrelease()
  })
}
const handleSizeChange = (val) => {
  console.log(`${val} items per page`)
  limit.value = val;
  console.log(limit.value, pages.value, current_page.value);

  switch (menuIndex.value) {
    case '1':
      axios.get(`${baseUrl}/api/userWorks/findAllWorksById`, {params: {limit: val}})
      .then(response => {
        current_page.value = response.data.item.current_page;
        for (let i = 0; i < response.data.item.data.length; i++) {
          let date = new Date(response.data.item.data[i].createTime);
          response.data.item.data[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))

          if (response.data.item.data[i].status === '0') {
            response.data.item.data[i].status = '草稿';
          } else if (response.data.item.data[i].status === '1') {
            response.data.item.data[i].status = '待审核';
          } else if (response.data.item.data[i].status === '2') {
            response.data.item.data[i].status = '已发布';
          } else {
            response.data.item.data[i].status = '审核不通过';
          }
        }
        ReleaseItem.value = response.data.item.data;
        console.log(response.data.item)
      })
      break;
    case '1-1':
      axios.get(`${baseUrl}/api/userWorks/findPassWorksByUserId`, {params: {limit: val}})
      .then(response => {
        showdata(response);
        ReleasedItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '1-2':
      axios.get(`${baseUrl}/api/userWorks/findAuditingWorksByUserId`, {params: {limit: val}})
      .then(response => {
        showdata(response);
        PendingItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '1-3':
      axios.get(`${baseUrl}/api/userWorks/findDraftByUserId`, {params: {limit: val}})
      .then(response => {
        showdata(response);
        DraftItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '1-4':
      axios.get(`${baseUrl}/api/userWorks/findFailWorksByUserId`, {params: {limit: val}})
      .then(response => {
        showdata(response);
        RejectedItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '2':
      axios.get(`${baseUrl}/api/collection/findUserCollection`, {params: {limit: val}})
      .then(response => {
        showdata(response);
        CollectionItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '3':
      axios.get(`${baseUrl}/api/userLikes/findUserLikes`, {params: {limit: val}})
      .then(response => {
        showdata(response);
        StarItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '4':
      axios.get(`${baseUrl}/api/comment/findCommentByUserId`, {params: {limit: val}})
      .then(response => {
        console.log("6666", response)
        showdata(response);
        CommentItem.value = response.data.item.data
      })
      break;
    case '5':
      axios.get(`${baseUrl}/api/viewHistory/selectViewHistoryById`, {params: {limit: val}})
      .then(response => {
        showdata(response);
        HistoryItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
  }
}
const handleCurrentChange = (val) => {
  console.log(`current page: ${val}`)
  current_page.value = val;
  console.log(limit.value, pages.value, current_page.value);

  switch (menuIndex.value) {
    case '1':
      axios.get(`${baseUrl}/api/userWorks/findAllWorksById`, {params: {page: val, limit: limit.value}})
      .then(response => {
        current_page.value = response.data.item.current_page;
        for (let i = 0; i < response.data.item.data.length; i++) {
          let date = new Date(response.data.item.data[i].createTime);
          response.data.item.data[i].createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))

          if (response.data.item.data[i].status === '0') {
            response.data.item.data[i].status = '草稿';
          } else if (response.data.item.data[i].status === '1') {
            response.data.item.data[i].status = '待审核';
          } else if (response.data.item.data[i].status === '2') {
            response.data.item.data[i].status = '已发布';
          } else {
            response.data.item.data[i].status = '审核不通过';
          }
        }
        ReleaseItem.value = response.data.item.data;
        console.log(response.data.item)
      })
      break;
    case '1-1':
      axios.get(`${baseUrl}/api/userWorks/findPassWorksByUserId`, {params: {page: val, limit: limit.value}})
      .then(response => {
        showdata(response);
        ReleasedItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '1-2':
      axios.get(`${baseUrl}/api/userWorks/findAuditingWorksByUserId`, {params: {page: val, limit: limit.value}})
      .then(response => {
        showdata(response);
        PendingItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '1-3':
      axios.get(`${baseUrl}/api/userWorks/findDraftByUserId`, {params: {page: val, limit: limit.value}})
      .then(response => {
        showdata(response);
        DraftItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '1-4':
      axios.get(`${baseUrl}/api/userWorks/findFailWorksByUserId`, {params: {page: val, limit: limit.value}})
      .then(response => {
        showdata(response);
        RejectedItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '2':
      axios.get(`${baseUrl}/api/collection/findUserCollection`, {params: {page: val, limit: limit.value}})
      .then(response => {
        total.value = response.data.item.total;
        limit.value = response.data.item.limit;
        current_page.value = response.data.item.current_page;
        pages.value = response.data.item.pages;
        for (let i = 0; i < response.data.item.data.length; i++) {
          let date = new Date(response.data.item.data[i].collectTime);
          response.data.item.data[i].collectTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
        }
        CollectionItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '3':
      axios.get(`${baseUrl}/api/userLikes/findUserLikes`, {params: {page: val, limit: limit.value}})
      .then(response => {
        total.value = response.data.item.total;
        limit.value = response.data.item.limit;
        current_page.value = response.data.item.current_page;
        pages.value = response.data.item.pages;
        for (let i = 0; i < response.data.item.data.length; i++) {
          let date = new Date(response.data.item.data[i].likesTime);
          response.data.item.data[i].likesTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
        }
        StarItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
    case '4':
      axios.get(`${baseUrl}/api/comment/findCommentByUserId`, {params: {page: val, limit: limit.value}})
      .then(response => {
        console.log("6666", response)
        total.value = response.data.item.total;
        limit.value = response.data.item.limit;
        current_page.value = response.data.item.current_page;
        pages.value = response.data.item.pages;
        for (let i = 0; i < response.data.item.data.length; i++) {
          let date = new Date(response.data.item.data[i].commentTime);
          response.data.item.data[i].commentTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
        }
        CommentItem.value = response.data.item.data
      })
      break;
    case '5':
      axios.get(`${baseUrl}/api/viewHistory/selectViewHistoryById`, {params: {page: val, limit: limit.value}})
      .then(response => {
        total.value = response.data.item.total;
        limit.value = response.data.item.limit;
        current_page.value = response.data.item.current_page;
        pages.value = response.data.item.pages;
        for (let i = 0; i < response.data.item.data.length; i++) {
          let date = new Date(response.data.item.data[i].viewTime);
          response.data.item.data[i].viewTime = dateUtil.toChineseString(dateUtil.UTCToLocal(date))
        }
        HistoryItem.value = response.data.item.data
        console.log(response.data.item.data)
      })
      break;
  }
}

const getPermission = () => {
  axios.get(`${baseUrl}/api/auth/getInfo`).then((response) => {
        console.log("权限庞倩倩1--------")
        console.log(response.data.item)
        let perms = response.data.item;
        store.dispatch("SET_PERMISSION", perms);
      }
  ).catch(function (err) {
    console.log(err)
  });

}
const hasPerms = (perms) => {
  // 根据权限标识和外部指示状态进行权限判断
  return hasPermission(perms)

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
  /*background-color: white;*/
  flex: auto;
  border-radius: 15px;
  /*box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);*/
}

.content-left {
  flex: auto;
  width: 400px;
  padding-top: 5%;
  display: flex;
  flex-flow: column nowrap;
  text-align: center;
  background-color: #c8e0c8;
  padding-bottom: 8%;
  border-radius: 15px;
}

.content-right {
  flex: auto;
  width: 900px;
  margin: 0 10px;
  display: flex;
  flex-flow: column nowrap;
  background-color: white;
  border-radius: 15px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.img {
  position: relative;
}

a {
  text-decoration: none;
}

.leftBody {
  padding: 20px;
}

.leftBody p {
  font-size: 14px;
  margin: 8px;
  font-weight: 700;
  text-align: center;
}

.demo-pagination-block {
  position: relative;
  bottom: 0;
  padding: 10px;
}
</style>
