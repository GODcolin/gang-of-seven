<template>
  <div class="box2">
    <div class="pwd">
      <el-form style="padding: 10%">
        <el-form-item>
          <el-input v-model="account" placeholder="用户名"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input v-model="verifyCode" placeholder="验证码" style="position: absolute;width: 60%"></el-input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <el-button type="primary" @click="getVerifyCode" v-if="btnBool"
                     style="position: absolute;width: 30%;right: 0">{{ countdown }}
          </el-button>
          <el-button type="primary" v-if="!btnBool" style="position: absolute;width: 30%;right: 0">{{ countdown }}
          </el-button>
        </el-form-item>
        <el-form-item>
          <el-input type="password" v-model="password" placeholder="新密码"></el-input>
        </el-form-item>
        <br>
        <el-form-item>
          <div class="input_span">
            <label>强度:</label>
            <span id="one"></span>
            <span id="two"></span>
            <span id="three"></span>
          </div>
          <div id="font">
            <span>弱</span>
            <span>中</span>
            <span>强</span>
          </div>
        </el-form-item>
        <el-form-item>
          <el-input type="password" v-model="verifyPassword" placeholder="确认新密码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="send" :disabled="dis===true" style="width: 100%">修改</el-button>
        </el-form-item>
        <br><br>
      </el-form>
    </div>
  </div>
</template>

<script>
import {ref, watch} from 'vue'
import axios from "axios";
import {ElMessage} from "element-plus";
import {useRouter, useRoute} from 'vue-router'
import baseUrl from "../utils/interface.js";

export default {
  name: "ForgetPassword",
  setup() {
    const verifyPassword = ref('')
    let msgText = ref('')
    const account = ref('')
    const password = ref('')
    const verifyCode = ref('')
    const router = useRouter()
    const route = useRoute()
    let countdown = ref("获取验证码")
    let dis = ref(false)
    let btnBool = ref(true)
    const getVerifyCode = async () => {
      if (account.value !== '') {
        console.log("向后端要验证码")
        console.log(account.value)
        await axios.post(`${baseUrl}/api/auth/sendCode`, {username: account.value}).then(res => {
          if (res.data.error === 1) {
            ElMessage({
              message: '用户名不存在！',
              type: 'error',
            })
            account.value = ''
          } else {
            console.log("验证码返回的消息", res)
            btnBool.value = false
            let i = 300
            let timer = setInterval(() => {
              countdown.value = i + "s"
              i--
              if (i < 0) {
                btnBool.value = true
                countdown.value = "获取验证码"
                clearInterval(timer)
              }
            }, 1000)
          }
        })
      } else {
        ElMessage({
          message: '请输入用户名！',
          type: 'error',
        })
      }

    }
    const send = async () => {
      dis.value = true
      if (verifyPassword.value !== password.value) {
        ElMessage({
          message: '两次输入密码不一致',
          type: 'error',
        })
        password.value = ''
        verifyPassword.value = ''
        dis.value = false
      } else if (msgText <= 2) {
        ElMessage({
          message: '密码强度过低！',
          type: 'error',
        })
        password.value = ''
        verifyPassword.value = ''
        dis.value = false
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
      dis,
      btnBool,
      countdown,
      checkStrong
    }

  }
}
</script>

<style scoped>
.box2 {
  position: absolute;
  width: 100%;
  height: 100%;
  background: url("https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00693-2745.jpg") 0 0 no-repeat;
  background-size: 100% 100%;
}

.pwd {
  background-color: rgba(255, 255, 255, 0.8);
  position: absolute;
  width: 30%;
  max-height: 70%;
  left: 35%;
  right: 35%;
  top: 15%;
  bottom: 25%;
  border-radius: 15px;

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
