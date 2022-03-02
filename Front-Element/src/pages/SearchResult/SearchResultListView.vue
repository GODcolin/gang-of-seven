<template>

  <div>

    <el-table :data="knowledges"
              style="width: 100%" @row-click="enterDetail">
      <el-table-column prop="index" label="序号" align="center"/>
      <el-table-column prop="title" label="标题" align="center"/>
      <el-table-column prop="keyWords" label="关键词" align="center"/>
      <el-table-column prop="author" label="作者" align="center"/>
      <el-table-column prop="releaseTime" label="发布时间" align="center"/>
      <el-table-column prop="likeNumber" label="点赞量" align="center"/>
      <el-table-column prop="collectNumber" label="收藏量" align="center"/>
    </el-table>

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

</template>

<script>

import {ref, onBeforeMount, reactive, watch} from "vue";
import {useRouter, useRoute} from 'vue-router'
import axios from "axios";
import baseUrl from "../../utils/interface.js";
import dateUtil from "../../utils/date.util";


export default {
  name: "SearchResultListView",

  setup() {

    onBeforeMount(() => {
      searchKnowledges(query.value, 5, 1)
    })

    const searchKnowledges = async (q, limit, page) => {

      if (route.query.id !== undefined) {
        const {data: res} = await axios.get(
            `${baseUrl}/api/knowledge/selectKnowledgeByCategoryId?id=${route.query.id}&limit=${limit}&page=${page}`
        )

        paginationInfo.currentPage = res.item.current_page
        paginationInfo.pageSize = res.item.limit
        paginationInfo.totalItem = res.item.total
        console.log(res)
        knowledges.value = res.item.data.map((item, index) =>
            Object.defineProperty(item, 'index', {
                  value: (paginationInfo.currentPage - 1) * paginationInfo.pageSize + index + 1
                }
            )
        )

        knowledges.value.forEach((item) => {
              item.keyWords = item.keyWords.map(item => item.tagName)
              item.author = item.author.authorName
              item.releaseTime = dateUtil.toChineseString(dateUtil.UTCToLocal(new Date(item.releaseTime)))
            }
        )
        console.log('狗bug,',knowledges.value)
      }else{
        const {data: res} = await axios.get(
            `${baseUrl}/api/search?q=${q}&limit=${limit}&page=${page}`
        )

        paginationInfo.currentPage = res.current_page
        paginationInfo.pageSize = res.limit
        paginationInfo.totalItem = res.total
        console.log(res)
        knowledges.value = res.data.map((item, index) =>
            Object.defineProperty(item, 'index', {
                  value: (paginationInfo.currentPage - 1) * paginationInfo.pageSize + index + 1
                }
            )
        )

        knowledges.value.forEach((item) => {
              item.keyWords = item.keyWords.map(item => item.tagName)
              item.author = item.author.authorName
              item.releaseTime = dateUtil.toChineseString(dateUtil.UTCToLocal(new Date(item.releaseTime)))
            }
        )
      }
    }

    const route = useRoute()

    watch(route, () => {
      query.value = route.query.title
      searchKnowledges(query.value, 5, 1)
    })

    const knowledges = ref([])

    const router = useRouter()


    const query = ref(route.query.title)

    const paginationInfo = reactive({
      currentPage: '',
      pageSize: '',
      totalItem: '',
    })

    const handleSizeChange = (newPageSize) => {
      console.log(`改变每页数量,现在为${newPageSize}`)
      searchKnowledges(query.value, newPageSize, 1)
    }

    const handleCurrentChange = (currentPage) => {
      console.log(`改变当前页,现在为${currentPage}`)
      searchKnowledges(query.value, paginationInfo.pageSize, currentPage)
    }

    const enterDetail = (knowledge) => {
      router.push({
        path: 'KnowledgeDetail',
        query: {
          id: knowledge.id
        }
      })
    }

    return {
      knowledges,
      paginationInfo,
      handleSizeChange,
      handleCurrentChange,
      enterDetail
    }
  }
}
</script>

<style scoped>

</style>
