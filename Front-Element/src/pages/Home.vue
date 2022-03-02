<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>

    <el-main>
      <div class="content-container">

        <div class="content-left">

          <el-menu
              default-active="2"
              class="leftTop"
              collapse="isCollapse"
          >
            <div v-for="i in ClassifData">
              <el-sub-menu :index="i.id">
                <template #title>
                  <el-icon style="color: #00BEA9">
                    <expand/>
                  </el-icon>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ i.categoryName }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </template>
                <el-menu-item v-for="j in i.childrenCategorys" :index="j.id+'-'+i.id">
                  <router-link :to="{name:'SearchResult',query:{id:j.id}}">{{ j.categoryName }}</router-link>
                </el-menu-item>
              </el-sub-menu>
            </div>
          </el-menu>

          <el-table :data="noticeData" class="leftBottom" @row-click="enterSearch()">
            <el-table-column label="公告" prop="title">
              <template #default="scope">
                <p>&nbsp;&nbsp;<el-icon>
                  <chat-line-square/>
                </el-icon>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  {{ scope.row.title }}
                </p>
              </template>

            </el-table-column>
          </el-table>

        </div>

        <div class="content-main">

          <el-carousel height="500">
            <el-carousel-item style="border-radius: 6px">
              <img src="../assets/走马灯1.png" class="im"  alt="">
            </el-carousel-item>
            <el-carousel-item style="border-radius: 6px">
              <img src="../assets/走马灯2.png" class="im"  alt="">
            </el-carousel-item>
            <el-carousel-item style="border-radius: 6px">
              <img src="../assets/走马灯3.png" class="im"  alt="">
            </el-carousel-item>
            <el-carousel-item style="border-radius: 6px">
              <img src="../assets/走马灯4.png" class="im" alt="">
            </el-carousel-item>
          </el-carousel>

          <div class="middleBottom">
            <div v-for="i in recommKnowledges">
              <router-link :to="{name:'KnowledgeDetail',query:{id:i.id}}"><h3 style="color: #19277f;margin-top: 10px">
                {{ i.title }}</h3></router-link>
              <div>
                &nbsp; &nbsp; &nbsp;<span style="font-size: 14px;color: #6d6d6d" v-html="i.content"></span>
                <div style="margin-top: 10px">
                  <el-row>
                    <star class="my-icon"/>
                    &nbsp;{{ i.collectNumber }}&nbsp;
                    <el-divider direction="vertical"></el-divider>

                    <pointer class="my-icon"/>
                    &nbsp;{{ i.likeNumber }}&nbsp;
                    <el-divider direction="vertical"></el-divider>

                  </el-row>
                </div>
                <el-divider style="margin-bottom: 0;"></el-divider>
              </div>
            </div>
          </div>

        </div>

        <div class="content-right">
          <div class="rightTop">
            <h3 style="color: red;">热搜排行榜</h3><br>
            <router-link :to="{name:'KnowledgeDetail',query:{id:i.id}}"
                         target="_blank"
                         style="margin-bottom: 10px"
                         v-for="(i,index) in HotTitle"
            >
              <div class="rank-item">
                <div class="rank-number">{{ index + 1 }}</div>
                <div class="rank-text">{{ i.title }}</div>
              </div>
            </router-link>
          </div>

          <el-table :data="NewItem" class="rightBottom" @row-click="enterSearch">
            <el-table-column label="最新知识" prop="title">
              <template #default="scope">
                <div style="display: flex;  flex-flow: row;">
                  <div> {{ scope.row.title }}</div>&nbsp;&nbsp;<div><el-icon color="#00bea9">
                  <d-arrow-right/>
                </el-icon></div>
                </div>
              </template>
            </el-table-column>
          </el-table>

        </div>

      </div>
    </el-main>

    <el-footer>
      <div class="home-footer">
        <span>版权所有 ©  <a href="http://60.174.249.204:10027/2021.12.25-2022.1.23">Gang Of Seven </a></span>
      </div>
    </el-footer>

  </el-container>

</template>

<script>
import {useRouter} from 'vue-router'
import SearchResultBasicViewItem from "../components/SearchResultBasicViewItem.vue";
import HomeHeadBar from "../components/HomeHeadBar.vue"
import axios from "axios";
import {onBeforeMount, ref} from "vue";
import baseUrl from "../utils/interface.js";
import dateUtil from "../utils/date.util.ts"

axios.defaults.baseURL = '/api'

const format = (str) => {
  return str.replace(/<[^>]+>/g, "");
}

export default {
  name: "Home",
  data() {
    return {
      clientHeight: document.body.clientHeight
    }
  },
  setup() {
    const router = useRouter()
    const NewItem = ref([{title: '', id: '', createTime: ''}])

    const ClassifData = ref([
      {
        id: '',
        categoryName: '',
        childrenCategorys: [
          {
            id: '',
            categoryName: ''
          },
        ]
      }])
    const noticeData = ref([{title: ''}])
    const HotTitle = ref([{title: ''}])
    const recommKnowledges = ref([{title: '', content: '', id: '', collectNumber: '', likeNumber: ''}])

    onBeforeMount(async () => {

      axios.get(`${baseUrl}/api/category/findAllCategory`)
      .then((response) => {
        ClassifData.value = response.data.list
      })

      axios.get(`${baseUrl}/api/notice/findAllNotice`)
      .then((response) => {
        noticeData.value = response.data.list
      })

      axios.get(`${baseUrl}/api/knowledge/findHotKnowledge`)
      .then((response) => {
        HotTitle.value = response.data.list
      })

      axios.get(`${baseUrl}/api/knowledge/findNewKnowledge`)
      .then((response) => {
        NewItem.value = response.data.list
        for (let i = 0; i < response.data.list.length; i++) {
          let aDate = new Date(response.data.list[i].createTime);
          let temp = dateUtil.toChineseString(dateUtil.UTCToLocal(aDate)).split(" ")
          NewItem.value[i].createTime = temp[0]
        }
        console.log("最新知识", response.data.list)
      })


      axios.get(`${baseUrl}/api/knowledge/recommendKnowledge`)
      .then((response) => {
        recommKnowledges.value = response.data.list
        recommKnowledges.value.forEach((item) => {
          const pureContent = format(item.content)
          item.content = pureContent.length > 150 ? pureContent.slice(0, 150) + '......' : pureContent
        })
      })

    })

    const enterSearch = (row) => {
      console.log("id是", row.id)
      router.push({
        name: 'KnowledgeDetail',
        query: {
          id: row.id
        }
      })
    }

    return {
      recommKnowledges,
      imgList: [
        {
          id: 0, idView: 'src/assets/走马灯1.png'
        },
        {
          id: 1, idView: 'src/assets/走马灯2.png'
        },
        {
          id: 2, idView: 'src/assets/走马灯3.png'
        },
        {
          id: 3, idView: 'src/assets/走马灯4.png'
        }
      ],
      HotTitle,

      ClassifData,
      data: [],
      noticeData,
      tableData: [],
      enterSearch,
      NewItem,
      Item: [{
        title: '123',
        content: '123'
      },
      ]
    }
  },
  components: {
    SearchResultBasicViewItem,
    HomeHeadBar,
  },
  mounted() {
    const that = this
    window.onresize = () => {
      return (() => {
        window.screenHeight = document.body.clientHeight
        that.clientHeight = window.screenHeight
      })()
    }
  },
  watch: {
    clientHeight(val) {
      // 为了避免频繁触发resize函数导致页面卡顿，使用定时器
      if (!this.timer) {
        // 一旦监听到的screenWidth值改变，就将其重新赋给data里的screenWidth
        this.clientHeight = val
        this.timer = true
        let that = this
        setTimeout(function () {
          // 打印screenWidth变化的值
          console.log(that.clientHeight)
          that.timer = false
        }, 400)
      }
    }
  }
}
</script>

<style scoped lang="less">

@deep: ~'>>>';

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
}

.content-left {
  flex: auto;
  width: 200px;
  display: flex;
  flex-flow: column nowrap;
}

.content-main {
  flex: auto;
  width: 800px;
  margin: 0 10px;
  display: flex;
  flex-flow: column nowrap;
}

.content-right {
  flex: auto;
  width: 300px;
  display: flex;
  flex-flow: column nowrap;
}

.leftTop {
  flex: auto;
  width: 100%;
  padding: 2%;
  margin: 0 0 10px 0;
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.leftBottom {
  flex: auto;
  margin: 0 0 10px 0;
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.middleTop {
  flex: auto;
  height: 500px;
  margin: 0 0 10px 0;
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

@{deep} .el-carousel__container {
  position: relative;
  height: 500px !important;
}

.my-carousel-item {
  height: 500px;
  border-radius: 6px;
}

.my-carousel-item img {
  width: 100%;
  border-radius: 6px;
  height: 100%;
}

.middleBottom {
  flex: auto;
  padding: 2%;
  background-color: white;
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.rightTop {
  flex: auto;
  padding: 4%;
  margin: 0 0 10px 0;
  background-color: white;
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.rightBottom {
  flex: auto;
  margin: 0 0 10px 0;
  background-color: white;
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.home-footer {
  height: 4%;
  line-height: 200%;
  background-color: white;
  text-align: center;
}

.rank-item {
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-start;
  align-items: center;
  margin: 0 0 10px 0;
}

.rank-number {
  flex: 0 0 30px;
  font-weight: 700;
  color: #f26d5f;
}

.rank-text {
  flex: auto;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

a {
  text-decoration: none;
  color: black;
  position: relative;
  height: 100%;
  width: 100%;
}

a:active {
  color: blue;
}

.my-icon {
  width: 20px;
  height: 15px;
}

.dateStyle {
  background-color: rgba(0, 190, 169, 0.5);
  color: white;
  padding: 1%;
  //border-style: ridge;
  //border-width: 2px;
  //border-color: black;
  border-radius: 10%;
  font-size: 6px;
}
</style>
