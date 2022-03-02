import {createRouter, createWebHashHistory} from "vue-router";
import axios from "axios";
import baseUrl from "../utils/interface";

const Home = () => import("../pages/Home.vue")
const KnowledgeDetail = () => import("../pages/KnowledgeDetail/KnowledgeDetail.vue")
const CollectFormPage = () => import("../pages/CollectFormPage.vue")
const KnowledgeJudgeList = () => import("../pages/KnowledgeJudgeList.vue")
const SearchResult = () => import("../pages/SearchResult/SearchResult.vue")
const Login = () => import("../pages/Login.vue")
const ForgetPassword = () => import("../pages/ForgetPassword.vue")
const TicketsTabs = () => import("../pages/TicketsTabs.vue")
const HomePage = () => import("../pages/HomePage.vue")
const PersonalCenter = () => import("../pages/PersonalCenter.vue")
const Setting = () => import("../pages/setting.vue")
const FeedbackHandle = () => import("../pages/FeedbackHandle.vue")
const HighLevelSearch = () => import("../pages/HighLevelSearch.vue")
const NotFound404 = () => import("../pages/404.vue")

const routes = [
  {
    path: "/",
    redirect: '/Login'
  },
  {
    path: "/Home",
    name: "Home",
    component: Home,
    meta: {
      requireAuth: true,
      title: "首页",
      permission: []
    }
  },
  {
    path: "/HighLevelSearch",
    name: "HighLevelSearch",
    component: HighLevelSearch,
    meta: {
      requireAuth: true,
      title: "高级搜索",
      permission: []
    }
  },
  {
    path: "/ForgetPassword",
    name: "ForgetPassword",
    component: ForgetPassword,
  },
  {
    path: "/KnowledgeDetail",
    name: "KnowledgeDetail",
    component: KnowledgeDetail,
    meta: {
      requireAuth: true,
      title: "知识详情",
      permission: []
    }
  },

  {
    path: "/KnowledgeJudgeList",
    name: "KnowledgeJudgeList",
    component: KnowledgeJudgeList,
    meta: {
      requireAuth: true,
      title: "知识",
      permission: [
        'business:knowledge:audit'
      ]
    }
  },
  {
    path: "/SearchResult",
    name: "SearchResult",
    component: SearchResult,
    meta: {
      requireAuth: true,
      title: "搜索结果",
      permission: []
    }
  },
  {
    path: "/HomePage",
    name: "HomePage",
    component: HomePage,
    meta: {
      requireAuth: true,
      title: "主页",
      permission: []
    },
  },
  {
    path: "/PersonalCenter",
    name: "PersonalCenter",
    component: PersonalCenter,
    meta: {
      requireAuth: true,
      title: "个人中心",
      permission: []
    },
  },
  {
    path: "/CollectFormPage",
    name: "CollectFormPage",
    component: CollectFormPage,
    meta: {
      requireAuth: true,
      keepAlive: true,
      permission: [
        'business:knowledge:add'
      ]
    }
  },
  {
    path: "/Login",
    name: "Login",
    component: Login,
    meta: {
      requireAuth: false,
      title: "登录"
    },
  },
  {
    path: "/TicketsTabs",
    name: "TicketsTabs",
    component: TicketsTabs,
    meta: {
      requireAuth: true,
      title: "工单",
      permission: [
        'business:ticket:query',
        'business:ticket:audit'
      ]
    },
  },
  {
    path: "/setting",
    name: "setting",
    component: Setting,
    meta: {
      requireAuth: true,
      title: "设置",
      permission: []
    },
  },
  {
    path: "/FeedbackHandle",
    name: "FeedbackHandle",
    component: FeedbackHandle,
    meta: {
      requireAuth: true,
      title: "反馈处理",
      permission: [
        'business:feedback:query',
        'business:feedback:audit'
      ]
    },
  },
  {
    path: '/404',
    name: '404 Not Found',
    component: NotFound404,
    meta: {
      requireAuth: false,
      title: '404 Not Found'
    }
  }
];

const router = createRouter({
  history: createWebHashHistory(),
  routes
});

router.beforeEach(async (to, form, next) => {
  if (!to.meta.requireAuth) {
    next();
    return;
  }
  // 判断该路由是否需要登录权限
  console.log("进入需要判断权限的地方");
  try {
    let response = await axios.get(`${baseUrl}/api/preflight`);
    let permissions = new Set(response.data);
    let hasPermission = (() => {
      if (to.meta.permission.length === 0) {
        return true;
      }
      if (permissions.has('*:*:*')) {
        return true;
      }
      return to.meta.permission.some(permission => permissions.has(permission));
    })();
    if (hasPermission) {
      next();
    } else {
      next({
        path: '/404',
        query: {redirect: to.fullPath}
      });
    }
  } catch (err) {
    if (err.response.status === 401) {
      next({
        path: '/',
        query: {redirect: to.fullPath}
      });
    }
  }
});

router.afterEach((to, from, next) => {
  document.title = to.meta.title || "知识库系统"
})

export default router;
