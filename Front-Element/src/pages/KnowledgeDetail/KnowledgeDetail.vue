<template>
  <el-container>
    <el-header>
      <HomeHeadBar/>
    </el-header>
    <el-main>
      <div class="content-container">
        <div class="top">
          <h2 style="margin-bottom: 5px">{{ knowledgeDetail.title }}</h2>
        </div>
        <div class="middle">

          <el-row style="height: 11px;margin-top: 15px">

            <my-view class="my-icon"/>
            <span style="height: 11px">&nbsp;{{ knowledgeDetail.viewCount }}&nbsp;&nbsp;</span>

            <clock class="my-icon"/>
            <span style="height: 11px">&nbsp;{{ knowledgeDetail.releaseTime }}&nbsp;&nbsp;</span>

            <user class="my-icon"/>
            <span style="height: 11px">&nbsp;{{ knowledgeDetail.author }}&nbsp;</span>

            <div class="my-operation">
              <checked class="my-icon"/>
              <el-link @click="feedbackDialogVisible = true">反馈</el-link>
              <el-dialog v-model="feedbackDialogVisible" title="知识修改">

                <el-form
                    ref="ruleFormRef"
                    :model="feedbackRuleForm"
                    :rules="feedbackRuleFormRules"
                    label-width="120px"
                    class="demo-ruleForm"
                    :size="feedbackFormSize"
                >
                  <el-form-item label="反馈类型" prop="feedbackType">
                    <el-select v-model="feedbackRuleForm.feedbackType" placeholder="反馈类型">
                      <el-option label="存在错字" value="存在错字"></el-option>
                      <el-option label="样式问题" value="样式问题"></el-option>
                      <el-option label="内容错误" value="内容错误"></el-option>
                      <el-option label="知识过时" value="知识过时"></el-option>
                      <el-option label="政治相关" value="政治相关"></el-option>
                      <el-option label="内容涉黄" value="内容涉黄"></el-option>
                    </el-select>
                  </el-form-item>

                  <el-form-item label="反馈内容" prop="content">
                    <el-input v-model="feedbackRuleForm.content" type="textarea"></el-input>
                  </el-form-item>


                </el-form>

                <template #footer>
            <span class="dialog-footer">
              <el-button @click="feedbackCancel();feedbackDialogVisible = false">取消</el-button>
              <el-button type="primary" @click="feedbackSubmit()">提交</el-button>
            </span>
                </template>

              </el-dialog>

            </div>
            <div class="my-operation">
              <notebook class="my-icon"/>
              <el-link @click="showHistory">知识历史</el-link>
            </div>

            <div class="my-operation">
              <el-popover
                  placement="bottom"
                  title="扫一扫，分享知识~~"
                  width="200"
                  trigger="hover"
              >
                <template #reference>
                  <el-button type="primary" icon="Share">分享</el-button>
                </template>
                <img :src="link" alt="二维码" width="150">

              </el-popover>
            </div>

          </el-row>

          <el-row style="margin-top: 30px">
            <span>&nbsp;知识来源:&nbsp;</span>
            <div class="source">
              {{ knowledgeDetail.source }}
            </div>
          </el-row>

          <el-divider></el-divider>

          <div v-if="knowledgeDetail.keyWords">
            关键词：
            <el-tag v-for="keyword in knowledgeDetail.keyWords" class="tag">
              {{ keyword }}
            </el-tag>
          </div>

          <div style="margin-top: 7px">
            分类：
            <el-tag type="success" class="tag">{{ knowledgeDetail.category }}</el-tag>
          </div>
          <el-divider></el-divider>
        </div>
        <div class="bottom">

          <div>
            <div  class="con" v-html="knowledgeDetail.contentHtml"/>

            <el-affix>
              <el-card shadow="never" style="background-color: white; box-shadow: 0 -5px 5px lightgray;">

                <img src='../../assets/已点赞.png' width="40" v-if="isLiked" @click="like" alt="">
                <img src='../../assets/未点赞.png' width="40" v-else @click="like" alt="">
                <span>&nbsp;&nbsp;{{ knowledgeDetail.likeCount }}&nbsp;&nbsp;</span>

                <img src='../../assets/已收藏.png' width="40" v-if="isCollected" @click="collect" alt="">
                <img src='../../assets/未收藏.png' width="40" v-else @click="collect" alt="">
                <span>&nbsp;&nbsp;&nbsp;{{ knowledgeDetail.collectCount }}</span>

              </el-card>
            </el-affix>

          </div>

          <knowledge-detail-comment style="margin-top: 70px" :id="knowledgeDetail.id"/>
        </div>
      </div>
      <div class="bottom2">
        <el-backtop :bottom="100">
          <div class="backtop">↑</div>
        </el-backtop>
      </div>

    </el-main>
  </el-container>
  <el-drawer
      v-model="historyshowed"
      title="知识历史版本——前世今生"
      direction="rtl"
      size="50%"
  >
    <el-table :data="historyData" @row-click="enterHisotry">
      <el-table-column property="version" label="版本" width="100"></el-table-column>
      <el-table-column property="title" label="标题" width="200" align="center"></el-table-column>
      <el-table-column property="keyWords" label="关键词" align="center"></el-table-column>
      <el-table-column property="releaseTime" label="发布时间" align="center"></el-table-column>
    </el-table>
  </el-drawer>
</template>

<script>

import {onBeforeMount, reactive, ref, watch,} from "vue";
import {useRoute, useRouter} from "vue-router";
import axios from "axios";
import {ElMessage, ElMessageBox, ElNotification} from "element-plus";
import KnowledgeDetailComment from './KnowledgeDetailComment.vue'
import HomeHeadBar from "../../components/HomeHeadBar.vue";
import baseUrl from "../../utils/interface.js";
import dateUtil from "../../utils/date.util";


export default {
  name: "KnowledgeDetail",

  setup() {

    const route = useRoute()

    const router = useRouter()

    const getDetail = async () => {
      const {data: res} = await axios.get(
          `${baseUrl}/api/knowledge/findByKnowledgeId`,
          {
            params: {
              id: route.query.id
            }
          }
      )
      knowledgeDetail.title = res.item.title
      knowledgeDetail.viewCount = res.item.viewCounts
      knowledgeDetail.author = res.item.user.authorName
      knowledgeDetail.releaseTime = dateUtil.toChineseString(dateUtil.UTCToLocal(new Date(res.item.createTime)))
      knowledgeDetail.id = res.item.id
      knowledgeDetail.source = res.item.source.name
      knowledgeDetail.keyWords = res.item.tags.map(item => item.tagName)
      knowledgeDetail.category = res.item.category.categoryName
      knowledgeDetail.contentHtml = res.item.content
      knowledgeDetail.likeCount = res.item.likeCounts
      knowledgeDetail.collectCount = res.item.collectCounts
      knowledgeDetail.masterId = res.item.masterId

      const {data: codeRes} = await axios.get(
          `${baseUrl}/api/knowledge/qrCode`,
          {
            params: {
              id: route.query.id
            },
            responseType: 'arraybuffer'
          }
      )
      const bytes = new Uint8Array(codeRes)
      let binary = ''
      bytes.forEach((item) => binary += String.fromCharCode(item))
      link.value = 'data:image/jpeg;base64,' + window.btoa(binary)

      const {data: likeData} = await axios.get(
          `${baseUrl}/api/userLikes/checkIsLike`,
          {
            params: {
              id: route.query.id
            },
          }
      )
      isLiked.value = likeData.item


      const {data: colloctData} = await axios.get(
          `${baseUrl}/api/collection/checkIsCollect`,
          {
            params: {
              id: route.query.id
            },
          }
      )
      isCollected.value = colloctData.item
    }

    watch(route, () => getDetail())

    onBeforeMount(() => getDetail())

    const modifyDialogVisible = ref(false)

    const feedbackDialogVisible = ref(false)

    const isLiked = ref('')

    const isCollected = ref('')

    const historyshowed = ref(false)

    const knowledgeDetail = reactive({
          title: '',
          viewCount: '',
          releaseTime: '',
          author: '',
          id: '',
          source: '',
          keyWords: '',
          category: '',
          contentHtml: '',
          likeCount: '',
          collectCount: '',
        }
    )

    const historyData = ref([])

    const modifyConfirm = () => {
      ElMessage({
        type: 'success',
        message: '修改已交由管理员审核',
      })
    }

    const modifyCancel = () => {
      ElMessage({
        type: 'info',
        message: '取消修改',
      })
    }

    const delKnowledge = () => {
      ElMessageBox.confirm(
          '是否确认删除？',
          '警告',
          {
            confirmButtonText: '确认',
            cancelButtonText: '取消',
            type: 'warning',
          }
      ).then(() => {
        axios.delete(`${baseUrl}/api/knowledge/deleteKnowledgeById`, {
          params: {
            id: knowledgeDetail.id
          }
        })

        ElMessage({
          type: 'success',
          message: '删除已交由管理员审核',
        })
      }).catch(() => {
        ElMessage({
          type: 'info',
          message: '取消删除',
        })
      })
    }

    const like = () => {
      isLiked.value = !isLiked.value
      if (isLiked.value === true) {
        knowledgeDetail.likeCount += 1
        axios.post(`${baseUrl}/api/userLikes/addUserLike`, {
              knowledgeId: route.query.id
            }
        )
        ElMessage({
          showClose: true,
          type: 'success',
          message: '点赞成功',
        })

      } else {
        knowledgeDetail.likeCount -= 1
        axios.delete(`${baseUrl}/api/userLikes/cancelUserLike`, {
              params: {
                id: route.query.id
              }
            }
        )
        ElMessage({
          showClose: true,
          type: 'info',
          message: '取消点赞',
        })
      }
    }

    const collect = () => {
      isCollected.value = !isCollected.value
      if (isCollected.value === true) {
        knowledgeDetail.collectCount += 1
        axios.post(`${baseUrl}/api/collection/addCollection`, {
              knowledgeId: route.query.id
            }
        )
        ElMessage({
          showClose: true,
          type: 'success',
          message: '收藏成功',
        })

      } else {
        knowledgeDetail.collectCount -= 1
        axios.delete(`${baseUrl}/api/collection/cancelUserCollection`, {
              params: {
                id: route.query.id
              }
            }
        )
        ElMessage({
          showClose: true,
          type: 'info',
          message: '取消收藏',
        })
      }
    }

    const showHistory = async () => {
      const {data: res} = await axios.get(
          `${baseUrl}/api/knowledge/findHistoryKnowledge`,
          {
            params: {
              masterId: knowledgeDetail.masterId
            }
          }
      )
      historyshowed.value = !historyshowed.value
      historyData.value = res.list.map((item, index) =>
          Object.defineProperty(item, 'version', {value: `V ${index + 1}.0`})
      )
      historyData.value.forEach((item) => {
        item.keyWords = item.keyWords.map(item => item.tagName)
        item.author = item.author.authorName
        item.releaseTime = new Date(item.releaseTime).toLocaleString(
            'zh-CN',
            {
              timeZone: 'Asia/Shanghai'
            }
        )
      })
    }

    const enterHisotry = (knowledge) => {
      router.push({
        path: 'KnowledgeDetail',
        query: {
          id: knowledge.id
        }
      })
    }

    const feedbackRuleForm = reactive({
      feedbackType: '',
      content: '',
    })

    const feedbackRuleFormRules = reactive({
      feedbackType: [
        {
          required: true,
          message: '请至少选择一个类型',
          trigger: 'change',
        },
      ],
      content: [
        {
          required: true,
          message: '反馈理由为必填项',
          trigger: 'blur',
        },
      ],
    })

    const feedbackFormSize = ref('')

    const feedbackSubmit = () => {

      if (feedbackRuleForm.feedbackType === '' || feedbackRuleForm.content === '') {
        ElMessageBox.alert('请填写完所有必填项', '注意', {
          confirmButtonText: 'OK'
        })
      } else {
        axios.post(`${baseUrl}/api/feedback/add`, {
              knowledgeId: route.query.id,
              type: feedbackRuleForm.feedbackType,
              content: feedbackRuleForm.content
            }
        )
        ElNotification({
          title: '发送成功',
          message: '反馈已提交',
          type: 'success',
        })
        feedbackDialogVisible.value = false
        feedbackRuleForm.feedbackType = ""
        feedbackRuleForm.content = ""
      }
    }

    const feedbackCancel = () => {
      ElNotification({
        title: '取消',
        message: '取消反馈操作',
        type: 'info',
      })
      feedbackRuleForm.feedbackType = ""
      feedbackRuleForm.content = ""
    }

    const link = ref('')

    return {
      knowledgeDetail,
      modifyDialogVisible,
      feedbackDialogVisible,
      isLiked,
      isCollected,
      historyshowed,
      historyData,
      feedbackRuleForm,
      feedbackRuleFormRules,
      feedbackFormSize,
      link,
      enterHisotry,
      modifyConfirm,
      modifyCancel,
      delKnowledge,
      like,
      collect,
      showHistory,
      feedbackSubmit,
      feedbackCancel,
    }
  },
  components:
      {
        KnowledgeDetailComment,
        HomeHeadBar
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
  padding-top: 5%;
  padding-left: 10%;
  padding-right: 10%;
  width: 80%;
  flex: auto;
  height: auto;
}

.middle {
  padding-left: 10%;
  padding-right: 10%;
  width: 80%;
  flex: auto;
  height: auto;
}

.bottom {
  padding-left: 10%;
  padding-right: 10%;
  width: 80%;
  flex: auto;
  height: auto;
}

.bottom2 {
  padding-left: 10%;
  padding-right: 10%;
  width: 80%;
  flex: auto;
  height: auto;
}

.backtop {
  height: 100%;
  width: 100%;
  background-color: white;
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.12);
  text-align: center;
  line-height: 40px;
  color: #1989fa;
  border-radius: 100%;
}

.my-icon {
  width: 16px;
  height: 11px;
  margin-top: 5px;
}

.my-operation {
  display: inline;
  height: 11px;
  color: dodgerblue;
  margin-left: 20px;
}

.source {
  display: inline;
  height: 11px;
  color: cadetblue;
}

.tag {
  margin-left: 5px;
}


</style>
