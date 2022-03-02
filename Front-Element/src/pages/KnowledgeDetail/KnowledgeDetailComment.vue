<template>
  <div>
    <el-divider>
      评论区
    </el-divider>

    <el-row style="height: 56px;margin-bottom: 30px">
      <div style="width: 10%">
        <el-avatar icon="UserFilled"/>
      </div>
      <el-input class="input" v-model="textarea" :rows="2" type="textarea" placeholder="请输入评论"/>
      <div style="display:inline;width: 10%;">
        <el-button style="margin-top: 10px;margin-left: 20px ;" type="success" @click="addCommit">
          添加评论
        </el-button>
      </div>
    </el-row>


    <div>
      <knowledge-detail-comment-item v-for="item in comments " key="id" :comment="item"/>
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

    <div style="margin-top: 500px">

    </div>


  </div>


</template>

<script>

import {onBeforeMount, ref, reactive, watch} from 'vue'
import KnowledgeDetailCommentItem from './KnowledgeDetailCommentItem.vue'
import axios from "axios";
import {useRoute} from "vue-router";
import {ElMessage} from "element-plus";
import baseUrl from "../../utils/interface.js";
import dateUtil from "../../utils/date.util";

export default {

  name: "KnowledgeDetailComment",

  setup() {

    const route = useRoute()

    watch(route, () => getComments(route.query.id, 5, 1))

    onBeforeMount(() => {
      getComments(route.query.id, 5, 1)
    })

    const getComments = async (id, limit, page) => {
      const {data: res} = await axios.get(
          `${baseUrl}/api/comment/selectCommentByKnowledgeId?id=${id}&limit=${limit}&page=${page}`,
      )
      paginationInfo.currentPage = res.item.current_page
      paginationInfo.pageSize = res.item.limit
      paginationInfo.totalItem = res.item.total
      comments.value = res.item.data
      comments.value.forEach((item) =>
          item.createTime = dateUtil.toChineseString(dateUtil.UTCToLocal(new Date(item.createTime)))
      )
      console.log('我很绝望',comments)
    }

    const handleSizeChange = (newPageSize) => {
      getComments(route.query.id, newPageSize, 1)
    }

    const handleCurrentChange = (currentPage) => {
      getComments(route.query.id, paginationInfo.pageSize, currentPage)
    }

    const textarea = ref('')

    const showMore = ref(true)

    const comments = ref([])

    const paginationInfo = reactive({
      currentPage: '',
      pageSize: '',
      totalItem: '',
    })


    const addCommit = () => {
      axios.post(`${baseUrl}/api/comment/addComment`, {
        knowledgeId: route.query.id,
        content: textarea.value
      })

      ElMessage({
        type: 'success',
        message: '评论成功',
      })
      if (paginationInfo.currentPage === 1) {
        if (paginationInfo.totalItem >= paginationInfo.pageSize) {
          comments.value.pop()
        }

        comments.value.unshift({
          childrenComments: [],
          content: textarea.value,
          createTime: new Date().toLocaleString(
              'zh-CN',
              {
                timeZone: 'Asia/Shanghai'
              }
          ),
          id: -1,
          knowledgeId: route.query.id,
          nickName: JSON.parse(localStorage.getItem('userInfo')).nickname,
          parentId: 0,
          userId: JSON.parse(localStorage.getItem('userInfo')).userId,
          avatar:localStorage.getItem('avatar').slice(1,-1)
        })
      }
      textarea.value = ""
      // getComments(route.query.id, paginationInfo.pageSize, paginationInfo.currentPage)
    }

    return {
      textarea,
      paginationInfo,
      comments,
      showMore,
      addCommit,
      handleSizeChange,
      handleCurrentChange
    }
  },

  components: {
    KnowledgeDetailCommentItem
  }
}

</script>

<style scoped>

.input {
  height: 56px;
  width: 80%;
}
</style>
