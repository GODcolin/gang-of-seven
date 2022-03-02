<template>
  <div class="box">
    <h1 style="color: white;text-align: center;position: absolute;top: 15%;width: 30%;left: 35%;">知识库系统</h1>
    <div class="login">
      <el-form style="padding: 10%">
        <el-form-item>
          <el-input v-model="LoginForm.username" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input type="password" v-model="LoginForm.password" placeholder="密码"
                    @keyup.enter.native="this.Login"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input v-model="verificationCode" placeholder="验证码" @keyup.enter.native="this.Login"
                    style="position: absolute;width: 60%"></el-input>&nbsp;&nbsp;&nbsp;&nbsp;
          <!--            <Verify style="vertical-align:center;position: relative;top: 4px" :identify-code="identifyCode"></Verify>-->
          <img :src="imgurl" alt="" style="position: absolute;width: 30%;right: 0">
        </el-form-item>
        <el-form-item>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <el-link type="primary" @click="getVerify" style="position:absolute;right: 0">
            看不清，换一张
          </el-link>
        </el-form-item>
        <el-form-item>
          <el-button :loading="loading" type="primary" @click="Login" style="position: absolute;width: 100%">
            {{ loginButtion }}
          </el-button>
        </el-form-item>
        <el-form-item>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <el-link type="primary" @click="ForgetPassword" style="position:absolute;right: 0">
            忘记密码
          </el-link>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>

import {useRouter, useRoute} from 'vue-router'
import {ref, onBeforeMount, reactive} from "vue";
import authService from '../services/auth.service.js'
import {useStore} from "vuex";
import axios from "axios";
import baseUrl from "../utils/interface";


export default {
  name: "Login",
  setup() {
    let loading = ref(false)
    let identifyCode = ref('')
    const LoginForm = ref([{username: '', password: ''}])
    let captchaToken = reactive('')
    let verificationCode = ref('')
    const identifyCodes = ref('1234567890')
    const imgVerify = ref('')
    let imgurl = ref('')
    let loginButtion = ref("登录")
    onBeforeMount(async () => {
      await getVerify()
    })

    async function getVerify() {
      const {data: res} = await axios.get(`${baseUrl}/api/captcha`)
      console.log("收到的验证码", res)
      captchaToken = res.token;
      // obj.src = "data:image/jpeg;base64," + res.img;
      imgurl.value = res.img;
    }

    const router = useRouter()
    const route = useRoute()
    const store = useStore()
    const Login = () => {
      loading.value = true
      loginButtion.value = "登录中"
      authService.login(LoginForm.value, {
        token: captchaToken,
        code: verificationCode.value
      }).then(res => {
        store.commit('setUserInfo', res.data)
        router.push({
          name: 'Home',
          query: {
            nickname: res.data.nickname,
          },
        })
        console.log("收回来的信息", res.data.nickname)
        store.state.userId = res.data.userId
        store.state.nickname = res.data.nickname
        console.log("登陆成功")
        console.log(res)
      }).catch(error => {
        console.log("进入到错误判断")
        loading.value = false
        loginButtion.value = "登录"
        verificationCode.value = ''
        getVerify()
      })
    }

    const ForgetPassword = () => {
      router.push({
        name: 'ForgetPassword'
      })
    }

    return {
      Login,

      getVerify,
      LoginForm,
      imgurl,
      ForgetPassword,
      captchaToken,
      verificationCode,
      identifyCode,
      checked: false,
      loading,
      loginButtion,
      identifyCodes,
      // loginRules,
      passwordType: 'password'
    }
  }
}
</script>

<style scoped>

.box {
  position: absolute;
  width: 100%;
  height: 100%;
  background: url("https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00693-2745.jpg") 0 0 no-repeat;
  background-size: 100% 100%;
}

.login {
  background-color: rgba(255, 255, 255, 0.8);
  position: absolute;
  width: 30%;
  max-height: 50%;
  left: 35%;
  right: 35%;
  top: 25%;
  bottom: 25%;
  border-radius: 15px;
}

</style>
