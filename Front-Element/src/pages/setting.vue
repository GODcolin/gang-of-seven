<template>
  <el-container>

    <el-header>
      <HomeHeadBar/>
    </el-header>

    <el-main>
      <div class="content-container">
        <div class="left">
          <el-row class="tac">
            <el-col>
              <el-menu default-active="2" class="el-menu-vertical-demo" style="height: 600px">
                <el-menu-item index="2" @click="this.JumpPage(2)">推送设置</el-menu-item>
                <el-menu-item index="1" @click="this.JumpPage(1)">修改密码</el-menu-item>
                <el-menu-item index="3" @click="this.JumpPage(3)">隐私设置</el-menu-item>
                <el-menu-item index="4" @click="this.JumpPage(4)">推荐设置</el-menu-item>
              </el-menu>
            </el-col>
          </el-row>
        </div>
        <div class="right">
          <div v-if="index===1" class="form">
            <el-form label-position="left" label-width="100px">

              <td style="font-size: 25px">修改密码</td>
              <br/>
              <br/>
              <el-form-item style="margin-bottom: 0;vertical-align: center">
                <el-input type="password" v-model="password" placeholder="新密码" style="width: 315px"></el-input>
              </el-form-item>
              <br>
              <el-form-item>
                <div class="input_span">
                  <label>强度:</label>
                  <span id="one"></span>
                  <span id="two"></span>
                  <span id="three"></span>
                </div>
              </el-form-item>
              <el-form-item>
                <div id="font">
                  <span>弱</span>
                  <span>中</span>
                  <span>强</span>
                </div>
              </el-form-item>
              <el-form-item>
                <el-input type="password" v-model="verifyPassword" placeholder="确认新密码" style="width: 315px"></el-input>
              </el-form-item>
              <el-form-item style="margin-bottom: 0">
                <el-button style="width: 315px" type="primary" @click="send">修改</el-button>
              </el-form-item>
              <br><br>
            </el-form>
          </div>
          <!--  推送设置-->
          <div v-if="index===2" class="form">
            <el-form label-position="left" :model="pushSettingsForm" label-width="100px">

              <td style="font-size: 25px">推送设置</td>
              <br/>
              <br/>
              <el-form-item label="显示推荐消息">
                <el-switch v-model="pushSettingsForm.message"></el-switch>
              </el-form-item>

              <el-form-item label="显示评论我的">
                <el-switch v-model="pushSettingsForm.comment"></el-switch>
              </el-form-item>

              <el-form-item label="显示新公告">
                <el-switch v-model="pushSettingsForm.notice"></el-switch>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="pushSetting">确定修改设置</el-button>
              </el-form-item>

            </el-form>
          </div>
          <!--  隐私设置-->
          <div v-if="index===3" class="form">
            <span style="font-size: 25px">隐私设置</span>
            <br/>
            <br/>
            <span>
        在选择时间范围之前发布的知识，将对其他人不可见
      </span>
            <br/>
            <br/>
            <el-form>
              <el-form-item label="范围">
                <el-select v-model="privacySettingsForm.range" filterable placeholder="请选择分类">
                  <el-option label="全部" value="1"></el-option>
                  <el-option label="仅一年" value="2"></el-option>
                  <el-option label="仅半年" value="3"></el-option>
                  <el-option label="仅三个月" value="4"></el-option>
                </el-select>
              </el-form-item>

              <el-form-item>
                <el-button type="primary" @click="privacySetting">确认修改设置</el-button>
              </el-form-item>
            </el-form>
          </div>
          <!--  推荐设置-->
          <div v-if="index===4" class="form">
            <span style="font-size: 25px">推荐设置</span>
            <br/><br/>
            <span>在此设置推荐的类型和推荐内容的时间范围</span>
            <br/><br/>
            <el-form>
              <el-form-item label="推荐形式">
                <el-select v-model="this.recommendSettingForm.type" placeholder="请选择分类">
                  <el-option label="按照浏览量" value="1"></el-option>
                  <el-option label="按照点赞量" value="2"></el-option>
                  <el-option label="按照已收藏" value="3"></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="时间范围">
                <el-select v-model="this.recommendSettingForm.range" placeholder="请选择分类">
                  <el-option label="180天" value=180></el-option>
                  <el-option label="90天" value=2></el-option>
                  <el-option label="30天" value=30></el-option>
                  <el-option label="3天" value=3></el-option>
                </el-select>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="recommendSetting">确定修改设置</el-button>
              </el-form-item>
            </el-form>

          </div>
        </div>
      </div>
    </el-main>
  </el-container>

</template>

<script>
import HomeHeadBar from "../components/HomeHeadBar.vue";
import axios from "axios";
import {ElMessage} from "element-plus";
import baseUrl from "../utils/interface.js";
import {ref, watch} from "vue";
import {useRoute, useRouter} from "vue-router";

export default {
  components: {
    HomeHeadBar
  },
  setup() {
    const verifyPassword = ref('')
    let msgText = ref('')
    const account = ref('')
    const password = ref('')
    const verifyCode = ref('')
    const router = useRouter()
    const route = useRoute()
    const getVerifyCode = async () => {
      console.log("向后端要验证码")
      console.log(account.value)
      await axios.post(`${baseUrl}/api/auth/sendCode`, {username: account.value})
    }
    const send = async () => {
      if (verifyPassword.value !== password.value) {
        ElMessage({
          message: '两次输入密码不一致',
          type: 'error',
        })
        password.value = ''
        verifyPassword.value = ''
      } else if (msgText <= 3) {
        ElMessage({
          message: '密码强度过低！',
          type: 'error',
        })
        password.value = ''
        verifyPassword.value = ''
      } else {
        console.log("给后端发验证码，密码，确认密码")
        await axios.post(`${baseUrl}/api/auth/resetPassword`, {
          username: account.value,
          verificationCode: verifyCode.value,
          newPassword: password.value,
        }).then(response => {
          ElMessage({
            message: '密码修改成功！',
            type: 'success',
          })
          router.push({
            name: 'Login'
          })
        })
      }
    }

    watch(password, (newname, oldname) => {
      msgText = checkStrong(newname);
      if (msgText > 1 || msgText === 1) {
        document.getElementById("one").style.background = "red";
      } else {
        document.getElementById("one").style.background = "#eee";
      }
      if (msgText > 2 || msgText === 2) {
        document.getElementById("two").style.background = "orange";
      } else {
        document.getElementById("two").style.background = "#eee";
      }
      if (msgText === 4) {
        document.getElementById("three").style.background = "#00D1B2";
      } else {
        document.getElementById("three").style.background = "#eee";
      }
    })

    const checkStrong = (sValue) => {
      let modes = 0;
      //正则表达式验证符合要求的
      if (sValue.length < 1) return modes;
      if (/\d/.test(sValue)) modes++; //数字
      if (/[a-z]/.test(sValue)) modes++; //小写
      if (/[A-Z]/.test(sValue)) modes++; //大写
      if (/\W/.test(sValue)) modes++; //特殊字符

      //逻辑处理
      return modes;
    }
    return {
      account,
      password,
      getVerifyCode,
      verifyCode,
      verifyPassword,
      send,
      checkStrong
    }

  },
  data() {
    return {
      index: 2,
      visible: true,
      changePasswordForm: {
        oldPassword: '',//这里需要默认填好当前的密码
        newPassword1: '',
        newPassword2: ''
      },
      privacySettingsForm: {
        range: ''
      },
      pushSettingsForm: {
        notice: false,
        comment: false,
        message: false
      },
      recommendSettingForm: {
        range: null,
        type: ''
      }
    }
  },
  methods: {
    JumpPage(val) {
      this.index = val;
    },
    submit() {
      ElMessage({
        message: '修改成功',
        type: 'success',
      });
    },
    cancel() {
      ElMessage({
        message: '已取消',
      });
    },
    privacySetting() {
      ElMessage({
        message: '修改成功',
        type: 'success',
      });
    },
    pushSetting() {
      ElMessage({
        message: '修改成功',
        type: 'success',
      });
    },
    recommendSetting() {
      axios.post(`${baseUrl}/api/rankSetting/setRecommendationSettings`,
          {
            limitTime: this.recommendSettingForm.range,
            type: this.recommendSettingForm.type
          }).then(() => {
            ElMessage(
                {
                  message: '修改设置成功',
                  type: 'success',
                })
          }
      )
      .catch(function (err) {
        console.err
      })
    }
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
  border-radius: 6px;
  box-shadow: 0 1px 3px 1px rgb(26 26 26 / 10%);
}

.left {
  flex: auto;
  width: 300px;
  display: flex;
  flex-flow: column nowrap;
  padding-left: 5%;
  padding-top: 5%;
}

.right {
  flex: auto;
  width: 1000px;
  display: flex;
  flex-flow: column nowrap;
  padding: 5%;
}

.input_span span {
  display: inline-block;
  width: 85px;
  height: 10px;
  background: #eee;
  line-height: 20px;
}

#one {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-right: 0 solid;
  margin-left: 20px;
  margin-right: 3px;
}

#two {
  border-left: 0 solid;
  border-right: 0 solid;
  margin-left: -5px;
  margin-right: 3px;
}

#three {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  border-left: 0 solid;
  margin-left: -5px;
}

#font span:nth-child(1) {
  color: red;
  margin-left: 80px;
}

#font span:nth-child(2) {
  color: orange;
  margin: 0 60px;
}

#font span:nth-child(3) {
  color: #00d1b2;
}

</style>
