import {createApp} from 'vue'
import 'element-plus/dist/index.css'
import App from './App.vue'
import axios from "axios";
import router from './plugins/router.js'
import {importElement} from "./plugins/element.js";
import store from "./plugins/store";
import Particles from "particles.vue3";

axios.interceptors.request.use(
  config => {
    if (localStorage.token) {
      config.headers.Authorization = `Bearer ${localStorage.token}`;
    }
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);

createApp(App)
.use(importElement)
.use(router)
.use(store)
.use(Particles)
.mount('#app')
