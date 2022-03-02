<template>
  <div style="margin-top: 50px;margin-bottom: 20px" class="author-title reply-father">
    <el-avatar class="header-img" :src="acomment.avatar" :size="40"/>
    <div class="author-info">
      <span class="author-name">{{ acomment.nickName }}</span>
      <span class="author-time">{{ acomment.createTime }}&nbsp;&nbsp;&nbsp;&nbsp;
        <el-button type="text" class="author-time" style="display: inline" @click="replyVisable=!replyVisable">
         回复
        </el-button>
      </span>
    </div>

    <div class="talk-box">
      <p>
        <span class="reply">{{ acomment.content }}</span>
      </p>
      <el-dialog v-model="replyVisable" :title=replytitle1>

        <el-form>
          <el-form-item>
            <el-input class="input" v-model="text" :rows="2" type="textarea" placeholder="请输入回复"/>
          </el-form-item>
        </el-form>

        <template #footer>
          <span class="dialog-footer">
            <el-button @click="replyVisable = false;cancelReply()">取消回复</el-button>
            <el-button type="primary" @click="reply()">回复</el-button>
          </span>
        </template>
      </el-dialog>

    </div>

    <div v-if="acomment.childrens.length > 0" class="reply-box">
      <div v-for="(reply, index) in acomment.childrens"
           :key="index" class="author-title">
        <br>
        <el-avatar
            class="header-img"
            :size="40"
            :src="reply.avatar"
        ></el-avatar>
        <div class="author-info">
          <span class="author-name">{{ reply.NickName }}</span>
          <span class="author-time">{{ reply.createTime }}&nbsp;&nbsp;&nbsp;&nbsp;
            <el-button type="text" class="author-time" style="display: inline" @click="replyVisable1=!replyVisable1">
             回复
            </el-button>
          </span>
        </div>
        <div class="talk-box">
          <p>
            <span>回复 {{ reply.toNickName }}:</span>
            <span class="reply">{{ reply.content }}</span>
          </p>

          <el-dialog v-model="replyVisable1" :title="reply.NickName">

            <el-form>
              <el-form-item>
                <el-input class="input" v-model="text" :rows="2" type="textarea" placeholder="请输入回复"/>
              </el-form-item>
            </el-form>

            <template #footer>
          <span class="dialog-footer">
            <el-button @click="replyVisable = false;cancelReply1()">取消回复</el-button>
            <el-button type="primary" @click="reply1(reply)">回复</el-button>
          </span>
            </template>
          </el-dialog>

        </div>
      </div>
    </div>

  </div>
</template>

<script>
import {onBeforeMount, ref, watch} from 'vue'
import {ElNotification, ElMessageBox} from "element-plus";
import axios from "axios";
import baseUrl from "../../utils/interface.js";
import {useRoute} from "vue-router";
import dateUtil from "../../utils/date.util";

let ans = []

const getAllChildrenComments = (name, id, children) => {
  if (name === undefined || children === undefined) return
  children.forEach((item) => {
    ans.push({
          toid: id,
          id: item.id,
          toNickName: name,
          NickName: item.nickName,
          content: item.content,
          avatar: item.avatar,
          createTime: dateUtil.toChineseString(dateUtil.UTCToLocal(new Date(item.createTime)))
        }
    )
    if (item.childrenComments.length > 0) {
      getAllChildrenComments(item.nickName, item.id, item.childrenComments)
    }
  })
}

export default {
  name: "KnowledgeDetailCommentItem",

  props: ['comment'],

  setup(props) {

    const acomment = ref(JSON.parse(JSON.stringify(props.comment)))  //深拷贝
    console.log(acomment)
    const computeChild = () => {
      ans = []
      getAllChildrenComments(acomment.value.nickName, acomment.value.id, acomment.value.childrenComments)
      acomment.value.childrens = ans
      console.log('狗bug去死啊',acomment.value.childrens)
    }

    watch(props, newvalue => {
      acomment.value = newvalue.comment
      computeChild()
    },)

    onBeforeMount(() => computeChild())


    const replyVisable = ref(false)

    const replyVisable1 = ref(false)

    const text = ref('')

    const route = useRoute()

    const reply = () => {
      if (text.value === '') {
        ElMessageBox.alert('回复内容不能为空', '注意', {
          confirmButtonText: 'OK'
        })
        return
      }
      axios.post(`${baseUrl}/api/comment/addComment`, {
        knowledgeId: route.query.id,
        content: text.value,
        parentId: acomment.value.id
      })

      acomment.value.childrens.push({
        toid: acomment.value.id,
        id: -1,
        toNickName: acomment.value.nickName,
        NickName: JSON.parse(localStorage.getItem('userInfo')).nickname,
        content: text.value,
        createTime: new Date().toLocaleString(
            'zh-CN',
            {
              timeZone: 'Asia/Shanghai'
            }
        ),
        avatar:localStorage.getItem('avatar').slice(1,-1)

      })
      console.log(acomment)
      replyVisable.value = false;
      ElNotification({
        title: '回复',
        message: '回复评论成功',
        type: 'success',
      })
      text.value = ''
    }

    const cancelReply = () => {
      ElNotification({
        title: '取消',
        message: '取消回复评论',
        type: 'info',
      })
      text.value = ''
    }

    const reply1 = (item) => {
      if (text.value === '') {
        ElMessageBox.alert('回复内容不能为空', '注意', {
          confirmButtonText: 'OK'
        })
        return
      }
      axios.post(`${baseUrl}/api/comment/addComment`, {
        knowledgeId: route.query.id,
        content: text.value,
        parentId: item.id
      })

      acomment.value.childrens.push({
        toid: item.id,
        id: -1,
        toNickName: item.toNickName,
        NickName: JSON.parse(localStorage.getItem('userInfo')).nickname,
        content: text.value,
        createTime: new Date().toLocaleString(
            'zh-CN',
            {
              timeZone: 'Asia/Shanghai'
            }
        ),
        avatar:localStorage.getItem('avatar').slice(1,-1)
      })
      replyVisable1.value = false;
      ElNotification({
        title: '回复',
        message: '回复评论成功',
        type: 'success',
      })
      text.value = ''
    }

    const cancelReply1 = () => {
      ElNotification({
        title: '取消',
        message: '取消回复评论',
        type: 'info',
      })
      text.value = ''
      replyVisable1.value = false;
    }

    return {
      acomment,
      replyVisable,
      text,
      replytitle1: "回复给" + acomment.value.nickName,
      reply,
      cancelReply,
      reply1,
      cancelReply1,
      replyVisable1
    }
  }
}
</script>


<style lang="scss" scoped>
.my-reply {
  padding: 10px;
  background-color: #fafbfc;

  .header-img {
    display: inline-block;
    vertical-align: top;
  }
}

.author-title:not(:last-child) {
  padding-bottom: 30px;
  border-bottom: 1px solid rgba(74, 136, 199, .3);
}

.reply-father {
  padding: 10px;

  .header-img {
    display: inline-block;
    vertical-align: top;
  }

  .author-info {
    display: inline-block;
    margin-left: 5px;
    width: 60%;
    height: 40px;
    line-height: 20px;

    span {
      display: block;
      //cursor: pointer;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
    }

    .author-name {
      color: #000;
      font-size: 18px;
      font-weight: bold;
    }

    .author-time {
      font-size: 14px;
    }
  }

  .talk-box {
    margin: 0 50px;

    p {
      margin: 0;
    }

    .reply {
      font-size: 16px;
      color: #000;
    }
  }

  .reply-box {
    margin: 10px 0 0 50px;
    background-color: #efefef;
    position: relative;
    border-radius: 15px;
    padding: 20px;
  }
}
</style>
