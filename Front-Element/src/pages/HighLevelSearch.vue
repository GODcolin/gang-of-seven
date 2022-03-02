<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>
    <el-main>
      <div class="content-container">
        <div class="top">
          <el-form :model="searchForm">
            <el-form-item>
              标题/内容&nbsp;&nbsp;&nbsp;<el-input v-model="searchForm.title" label="请输入" style="width: 375px"></el-input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              作者&nbsp;&nbsp;&nbsp;<el-input v-model="searchForm.author" label="请输入作者名字" style="width: 375px"></el-input>
            </el-form-item>
            <el-form-item>
              关键词&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<el-select v-model="searchForm.keyWords" multiple
                                                                            placeholder="关键词"
                                                                            style="width: 375px">
              <el-option v-for="k in keys" :key="k" :label="k" :value="k"></el-option>
            </el-select>
              <div class="block">
                <span class="demonstration">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类别</span>
                <el-cascader
                    v-model="searchForm.category"
                    :options="categorys"
                    :props="props"
                    @change="handleChange"
                    placeholder="类别"
                    style="width: 375px"
                ></el-cascader>
              </div>
            </el-form-item>
            <el-form-item>
              时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div style="width:400px">
                <el-col :span="11">
                  <el-date-picker
                      v-model="searchForm.beginTime"
                      type="date"
                      placeholder="开始时间"
                      style="width: 100%"
                  ></el-date-picker>
                </el-col>
                <el-col :span="2" class="text-center">
                  <span class="text-gray-500">-</span>
                </el-col>
                <el-col :span="11">
                  <el-date-picker
                      type="date"
                      v-model="searchForm.endTime"
                      placeholder="结束时间"
                      style="width: 100%"
                  ></el-date-picker>
                </el-col>
              </div>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" round @click="search">搜索</el-button>
              <el-button type="plain" round @click="clearAll">重置</el-button>
            </el-form-item>
          </el-form>
        </div>
        <div class="bottom">
          <el-header>
            <h2>搜索结果</h2>
          </el-header>
          <el-main>
            <el-tabs v-model="activeName">
              <el-tab-pane label="基本视图" name="基本视图">

                <div>
                  <search-result-basic-view-item v-for="knowledge in knowledges1" :knowledge="knowledge"/>

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


              </el-tab-pane>

              <el-tab-pane label="列表视图" name="列表视图">

                <div>

                  <el-table :data="knowledges2"
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
              </el-tab-pane>
            </el-tabs>
          </el-main>
        </div>
      </div>
    </el-main>
  </el-container>
</template>


<script lang="ts">

import {reactive, ref} from 'vue'
import axios from "axios";
import HomeHeadBar from "../components/HomeHeadBar.vue";
import baseUrl from "../utils/interface";
import {useRouter} from "vue-router";
import SearchResultBasicViewItem from '../components/SearchResultBasicViewItem.vue'
import dateUtil from "../utils/date.util";

export default {
  name: "HighLevelSearch",
  setup() {
    const activeName = ref('基本视图')
    const keys = ref(["5G", "4G", "流量", "话费", "装维", "客服", "卡号", "手机", "套餐", "靓号", "宽带", "充值", "智能"])
    const value = ref([])
    const props = {
      expandTrigger: 'hover',
    }
    const handleChange = (value) => {
      console.log(value)
    }
    const categorys = [
      {
        value: null,
        label: '费用查询',
        children: [{
          value: '话费余额',
          label: '话费余额',
        }, {
          value: '余额变动明细',
          label: '余额变动明细'
        }, {
          value: '账单查询',
          label: '账单查询'
        }, {
          value: '套餐使用',
          label: '套餐使用'
        }, {
          value: '电子发票',
          label: '电子发票'
        }]
      },
      {
        value: '详单查询',
        label: '详单查询',
        children: [{
          value: '语言详单查询',
          label: '语言详单查询'
        }, {
          value: '短信详单查询',
          label: '短信详单查询'
        }, {
          value: '上网详单查询',
          label: '上网详单查询'
        }]
      }, {
        value: "积分兑换",
        label: '积分兑换',
        children: [{
          value: '积分查询',
          label: '积分查询'
        }, {
          value: '积分兑换',
          label: '积分兑换'
        }, {
          value: '星级服务',
          label: '星级服务'
        },]
      },
      {
        value: "充值交费",
        label: '充值交费',
        children: [{
          value: '充值卡充值',
          label: '充值卡充值'
        }, {
          value: '充值卡余额查询',
          label: '充值卡余额查询'
        }, {
          value: '充值记录查询',
          label: '充值记录查询'
        },]
      },
      {
        value: "手机服务",
        label: '手机服务',
        children: [{
          value: '国际/港澳台',
          label: '国际/港澳台'
        }, {
          value: '实名补登记',
          label: '实名补登记'
        }, {
          value: '5G覆盖查询',
          label: '5G覆盖查询'
        }, {
          value: '一证通查',
          label: '一证通查'
        },]
      },
      {
        value: "卡号",
        label: '卡号',
        children: [{
          value: '5G套餐',
          label: '5G套餐'
        }, {
          value: '4G套餐',
          label: '4G套餐'
        }, {
          value: '卡号专区',
          label: '卡号专区'
        },]
      },
      {
        value: "业务",
        label: '业务',
        children: [{
          value: '宽带服务',
          label: '宽带服务'
        }, {
          value: '流量套餐',
          label: '流量套餐'
        }, {
          value: '智慧生活',
          label: '智慧生活'
        }, {
          value: '自助服务',
          label: '自助服务'
        }, {
          value: '热销推荐',
          label: '热销推荐'
        }, {
          value: '热门推荐',
          label: '热门推荐'
        }, {
          value: '装维',
          label: '装维'
        }, {
          value: '老用户',
          label: '老用户'
        },]
      },
      {
        value: "客服服务",
        label: '客服服务',
        children: [{
          value: '流量',
          label: '流量'
        }, {
          value: '话费',
          label: '话费'
        }, {
          value: '增值服务',
          label: '增值服务'
        },]
      },
    ]
    const searchForm = ref({
      title: '',
      keyWords: '',
      category: '',
      author: '',
      limit: '',
      page: '',
      beginTime: null,
      endTime: null,
    })
    const clearAll = () => {
      searchForm.value.title = ''
      searchForm.value.keyWords = ''
      searchForm.value.category = ''
      searchForm.value.author = ''
      searchForm.value.beginTime = null
      searchForm.value.endTime = null
    }

    const searchKnowledges = async (limit, page) => {

      searchForm.value.limit = limit
      searchForm.value.page = page
      if (searchForm.value.category.length == 2) {
        searchForm.value.category = searchForm.value.category[1]
      }
      console.log("传过去", searchForm.value)

      const {data: res} = await axios.get(
          `${baseUrl}/api/search/advancedSearchKnowledge`,
          {params: searchForm.value}
      )
      console.log("收到高级搜索结果", res)

      paginationInfo.currentPage = res.item.current_page
      paginationInfo.pageSize = res.item.limit
      paginationInfo.totalItem = res.item.total

      knowledges1.value = JSON.parse(JSON.stringify(res.item.data))

      knowledges2.value = res.item.data.map((item, index) =>
          Object.defineProperty(item, 'index', {
                value: (paginationInfo.currentPage - 1) * paginationInfo.pageSize + index + 1
              }
          )
      )

      knowledges2.value.forEach((item) => {
            item.keyWords = item.keyWords.map(item => item.tagName)
            item.author = item.author.authorName
            item.releaseTime = dateUtil.toChineseString(dateUtil.UTCToLocal(new Date(item.releaseTime)))
          }
      )
    }

    const search = () => {
      searchKnowledges(5, 1)
    }

    const handleSizeChange = (newPageSize) => {
      console.log(`改变每页数量,现在为${newPageSize}`)
      searchKnowledges(newPageSize, 1)
    }

    const handleCurrentChange = (currentPage) => {
      console.log(`改变当前页,现在为${currentPage}`)
      searchKnowledges(paginationInfo.pageSize, currentPage)
    }


    const paginationInfo = reactive({
      currentPage: '',
      pageSize: '',
      totalItem: '',
    })

    const knowledges1 = ref([])

    const knowledges2 = ref([])


    const router = useRouter()

    const enterDetail = (knowledge) => {
      router.push({
        path: 'KnowledgeDetail',
        query: {
          id: knowledge.id
        }
      })
    }

    return {
      search,
      searchForm,
      activeName,
      knowledges1,
      keys,
      knowledges2,
      paginationInfo,
      handleSizeChange,
      handleCurrentChange,
      enterDetail,
      clearAll,
      categorys,
      value,
      props,
      handleChange
    }
  },
  components: {
    HomeHeadBar,
    SearchResultBasicViewItem
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

.block {
  margin: 1rem;
}

.demonstration {
  margin: 1rem;
}
</style>