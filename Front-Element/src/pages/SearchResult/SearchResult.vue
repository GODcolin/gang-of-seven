<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>

    <el-main>
      <div class="content-container">
        <div class="top">
          <h2>搜索结果</h2>
        </div>

        <div class="bottom">
          <el-tabs v-model="activeName">
            <el-tab-pane label="基本视图" name="基本视图">
              <search-result-basic-view/>
            </el-tab-pane>

            <el-tab-pane label="列表视图" name="列表视图">
              <search-result-list-view/>
            </el-tab-pane>
          </el-tabs>
        </div>
      </div>
    </el-main>
  </el-container>

</template>

<script>

import {ref} from 'vue'
import SearchResultBasicView from './SearchResultBasicView.vue'
import SearchResultListView from './SearchResultListView.vue'
import HomeHeadBar from "../../components/HomeHeadBar.vue";

export default {
  name: "SearchResult",
  setup() {
    const activeName = ref('基本视图')
    return {
      activeName,
    }
  },
  components: {
    SearchResultBasicView,
    SearchResultListView,
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

</style>