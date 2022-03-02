<template>
  <div>
    <search-result-basic-view-item v-for="knowledge in knowledges" :knowledge="knowledge"/>

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

import SearchResultBasicViewItem from '../../components/SearchResultBasicViewItem.vue'
import {onBeforeMount, reactive, ref, watch} from "vue";
import axios from 'axios'
import baseUrl from "../../utils/interface.js";
import {useRoute} from "vue-router";

export default {

  name: "SearchResultBasicView",

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
        knowledges.value = res.item.data
      } else {

        console.log('看看limit',limit)
        const {data: res} = await axios.get(
            `${baseUrl}/api/search?q=${q}&limit=${limit}&page=${page}`
        )
        paginationInfo.currentPage = res.current_page
        paginationInfo.pageSize = res.limit
        paginationInfo.totalItem = res.total

        knowledges.value = res.data


      }

    }

    const route = useRoute()

    watch(route, () => {
      query.value = route.query.title
      searchKnowledges(query.value, 5, 1)
    })


    const handleSizeChange = (newPageSize) => {
      console.log(`改变每页数量,现在为${newPageSize}`)
      searchKnowledges(query.value, newPageSize, 1)
    }

    const handleCurrentChange = (currentPage) => {
      console.log(`改变当前页,现在为${currentPage}`)
      searchKnowledges(query.value, paginationInfo.pageSize, currentPage)
    }


    const query = ref(route.query.title)

    const paginationInfo = reactive({
      currentPage: '',
      pageSize: '',
      totalItem: '',
    })

    const knowledges = ref([])

    return {
      knowledges,
      paginationInfo,
      handleSizeChange,
      handleCurrentChange,
    }
  },

  components: {
    SearchResultBasicViewItem
  }
}

</script>

<style scoped>

</style>
