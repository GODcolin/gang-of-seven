<template>

  <div>
    <el-link><h3 @click="enterDetail">{{ knowledge.title }}</h3></el-link>

    <div v-if="aKnowledge.keyWords.length>0">
      关键词：
      <el-tag v-for="item in aKnowledge.keyWords" style="margin-left: 5px">
        {{ item }}
      </el-tag>
    </div>

    <div style="margin-top: 10px">
      {{ aKnowledge.content }}
    </div>

    <div style="margin-top: 10px">
      <span style="color: gray">
        {{ aKnowledge.author }} 发布于 {{ aKnowledge.releaseTime }}
      </span>
    </div>

    <div style="margin-top: 10px">
      <el-row>
        <star class="my-icon"/>
        &nbsp;{{ aKnowledge.collectNumber }}&nbsp;
        <el-divider direction="vertical"></el-divider>

        <pointer class="my-icon"/>
        &nbsp;{{ aKnowledge.likeNumber }}&nbsp;
        <el-divider direction="vertical"></el-divider>

        <chat-dot-round class="my-icon"/>
        <el-link @click="show">&nbsp;{{ aKnowledge.commentNumber }}</el-link>

      </el-row>
    </div>

    <div v-if="showComment===true">
      <div>
        <knowledge-detail-comment-item v-for="item in comments" :comment="item"></knowledge-detail-comment-item>
      </div>

      <div style="margin-top: 50px">
        <el-pagination
            v-model:currentPage="paginationInfo.currentPage"
            :page-sizes="[5, 10, 20, 50]"
            v-model:page-size=paginationInfo.pageSize
            layout="total, sizes, prev, pager, next, jumper"
            :total=paginationInfo.totalItem
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </div>

    <el-divider></el-divider>

  </div>

</template>

<script>

import {useRouter} from 'vue-router'
import {ref, reactive, watch, onBeforeMount} from "vue";
import KnowledgeDetailCommentItem from '../pages/KnowledgeDetail/KnowledgeDetailCommentItem.vue'
import axios from "axios";
import baseUrl from "../utils/interface.js";
import {useStore} from "vuex";
import dateUtil from "../utils/date.util";

const format = (str) => {
  return str.replace(/<[^>]+>/g, "");
}

export default {

  name: "SearchResultBasicViewItem",

  props: ['knowledge'],

  setup(props) {
    const store = useStore()

    const aKnowledge = ref(JSON.parse(JSON.stringify(props.knowledge)))

    onBeforeMount(() => process())


    watch(props, (newvalue) => {
      aKnowledge.value = JSON.parse(JSON.stringify(newvalue.knowledge))
      process()
    })


    const process = () => {
      aKnowledge.value.keyWords = aKnowledge.value.keyWords.map(item => item.tagName)
      const pureContent = format(aKnowledge.value.content)
      aKnowledge.value.content = pureContent.length > 200 ? pureContent.slice(0, 200) + '......'
          : pureContent

      aKnowledge.value.author = aKnowledge.value.author.authorName
      aKnowledge.value.releaseTime = new Date(aKnowledge.value.releaseTime).toLocaleString(
          'zh-CN',
          {
            timeZone: 'Asia/Shanghai'
          }
      )
    }

    const getComments = async (id, limit, page) => {
      console.log(id, limit, page)
      const {data: res} = await axios.get(
          `${baseUrl}/api/comment/selectCommentByKnowledgeId?id=${id}&limit=${limit}&page=${page}`,
      )
      console.log('新评论', res)
      paginationInfo.currentPage = res.item.current_page
      paginationInfo.pageSize = res.item.limit
      paginationInfo.totalItem = res.item.total
      comments.value = res.item.data
      comments.value.forEach((item) => {
            item.createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(new Date(res.item.createTime)))
          }
      )
    }

    const handleSizeChange = (newPageSize) => {
      console.log(`改变每页数量,现在为${newPageSize}`)
      getComments(aKnowledge.value.id, newPageSize, paginationInfo.currentPage)
    }

    const handleCurrentChange = (currentPage) => {
      console.log(`改变当前页,现在为${currentPage}`)
      getComments(aKnowledge.value.id, paginationInfo.pageSize, currentPage)
    }

    const router = useRouter()

    let showComment = ref(false)

    const comments = ref([])

    const paginationInfo = reactive({
      currentPage: '',
      pageSize: '',
      totalItem: '',
    })


    const show = async () => {
      showComment.value = !showComment.value
      if (showComment.value === true) {
        await getComments(aKnowledge.value.id, 5, 1)
      }

    }

    const enterDetail = () => {
      router.push({
        path: 'KnowledgeDetail',
        query: {
          id: props.knowledge.id
        }
      })
    }

    return {
      comments,
      showComment,
      aKnowledge,
      paginationInfo,
      enterDetail,
      show,
      handleSizeChange,
      handleCurrentChange
    }
  },

  components: {
    KnowledgeDetailCommentItem,
  }
}

</script>

<style scoped>
.my-icon {
  width: 16px;
  height: 11px;
}
</style>
