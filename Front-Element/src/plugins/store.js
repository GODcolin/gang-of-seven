import {createStore} from "vuex";

// 创建一个新的 store 实例
const store = createStore({
  state: {
    userId: '',
    avatar: '',
    nickname: '',
    searchComment: '',
    knowledgeId: null,
    userInfo: {},         //用户信息
    searchResult: [{
      title: '',
      collectNumber: '',
      content: '',
      dislikeNumber: '',
      keyWords: '',
      likeNumber: '',
      viewNumber: '',
      releaseTime: '',
    }],
    //权限------------------------------------------------
    permission: []
  },
  getters: {    //获取用户信息
    getUserInfo: state => {
      if (state.userInfo === undefined || state.userInfo.username === undefined) {
        let userInfo = window.sessionStorage.getItem("userInfo");
        if (userInfo === undefined) {
          return {};
        } else {
          state.userInfo = JSON.parse(userInfo);
          return state.userInfo;
        }
      } else {
        return state.userInfo
      }
    },
    getAvatar: state => {
      if (state.avatar === undefined) {
        let avatar = window.sessionStorage.getItem("avatar");
        state.avatar = JSON.parse(avatar);
        return state.avatar;
      } else {
        console.log("getAvatar", state.avatar)
        return state.avatar;
      }
    }
  },
  mutations: {
    setUserInfo(state, payload) {     //将用户信息保存到浏览器缓存
      window.sessionStorage.setItem("userInfo", JSON.stringify(payload));
      window.localStorage.setItem("userInfo", JSON.stringify(payload));
      state.userInfo = payload;
    },
    setKnowledgeId(state, knowledgeId) {
      state.knowledgeId = knowledgeId;
    },
    setAvatar(state, avatar) {
      console.log("展示state", state,"展示avatar", avatar)
      window.sessionStorage.setItem("avatar", JSON.stringify(avatar));
      window.localStorage.setItem("avatar", JSON.stringify(avatar));
      state.avatar = avatar;
    },
    //----------------------------------------------------------
    SET_PERMISSION(state, permission) {//permission 为传入的权限标识集合
      // 传入的权限集合 赋值给状态中的 permission
      state.permission = permission;
    }
  },
  actions: {
    SET_PERMISSION(context, permission) {
      context.commit("SET_PERMISSION", permission);
    }
  },
  plugins: []
});

export default store;
