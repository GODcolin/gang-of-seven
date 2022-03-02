<template>
  <el-header>
    <HomeHeadBar/>
  </el-header>

  <el-main>
    <div class="content-container">
      <!--  步骤线-->
      <div class="top">
        <el-steps :active="1">
          <el-step title="采编" :icon="Edit"></el-step>
          <el-step title="审核" :icon="Upload"></el-step>
          <el-step title="发布" :icon="SuccessFilled"></el-step>
        </el-steps>
      </div>
      <!--表单-->
      <div class="middle">
        <el-form label-position="right" :model="collectForm" label-width="100px" :rules="rules" ref="collectForm">
          <td style="font-size: 25px">知识采编</td>
          <br/><br/>
          <el-form-item label="标题" prop="title" style="width: 800px">
            <el-input
                v-model="collectForm.title"
                placeholder="请输入标题"
                @change="onTitleChange"
            />
          </el-form-item>

          <el-form-item label="关键词" prop="keywords">
            <el-select v-model="this.collectForm.keywords" multiple filterable placeholder="请选择关键词">
              <el-option v-for="keyword in this.keywords"
                         :key="keyword.index"
                         :label="keyword.tagName"
                         :value="keyword.index"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="分类" prop="classification">
            <el-select v-model="this.collectForm.classification" placeholder="请选择分类">
              <el-option v-for="category in this.categories"
                         :key="category.index"
                         :label="category.categoryName"
                         :value="category.index"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="可分享" prop="=share">
            <el-switch v-model="collectForm.share"></el-switch>
          </el-form-item>

          <el-form-item label="发为公告" prop="=notice">
            <el-switch v-model="collectForm.notice"></el-switch>
          </el-form-item>

          <el-form-item label="发布区域" prop="area">
            <el-checkbox-group v-model="collectForm.area">
              <el-checkbox v-for="area in this.areas"
                           :key="area.index"
                           :label="area.index">{{ area.deptName }}
              </el-checkbox>
            </el-checkbox-group>
          </el-form-item>

          <el-form-item label="知识渠道" prop="source">
            <el-radio-group v-model="collectForm.source">
              <el-radio v-for="source in this.sources"
                        :key="source.index"
                        :label="source.index">{{ source.name }}
              </el-radio>
            </el-radio-group>
          </el-form-item>

          <el-form-item label="终止时间" prop="finishDate">
            <el-col :span="9">
              <el-date-picker
                  v-model="collectForm.date"
                  type="date"
                  placeholder="选择日期"
                  style="width: 100%"
              ></el-date-picker>
            </el-col>
            <el-col :span="2" class="text-center">
              <span class="text-gray-500">        </span>
            </el-col>
            <el-col :span="9">
              <el-time-picker
                  v-model="collectForm.date2"
                  placeholder="选择时间"
                  style="width: 100%"
              ></el-time-picker>
            </el-col>
          </el-form-item>

        </el-form>
      </div>


      <!--  富文本编辑器-->
      <div class="bottom">
        <quill-editor
            :content="this.content"
            :options="editorOption"
            @blur="onEditorBlur"
            @focus="onEditorFocus"
            @ready="onEditorReady"
            style="height: 150px"
        />

        <br/>
        <!--按钮区域-->
        <div style="text-align: right">
          <el-button type="primary" @click="Submit">提交审核</el-button>
          <el-button type="disabled" @click="cancel">退出编辑</el-button>
        </div>
      </div>
    </div>
  </el-main>
</template>

<script>
import store from "../plugins/store";
import axios from "axios";
import HomeHeadBar from "../components/HomeHeadBar.vue";
import {ElMessage, ElMessageBox} from "element-plus";
import baseUrl from "../utils/interface.js";
import dateUtil from "../utils/date.util";
import {QuillEditor} from "@vueup/vue-quill";
import '@vueup/vue-quill/dist/vue-quill.snow.css';

export default {
  components: {QuillEditor, HomeHeadBar},
  data() {
    return {
      timer: '',
      keywords: [],
      categories: [],
      areas: [],
      sources: [],
      param: '1',
      content: '',
      collectForm: {
        title: '',
        keywords: [],
        classification: undefined,
        share: false,
        notice: false,
        area: [],
        source: {},
        date: '',
        date2: '',
        id: null

        //--------------------------------
      },
      rules: {
        title: [{required: true, trigger: 'blur', message: '必填项不能为空'}],
        keywords: [{required: true, trigger: 'blur', message: '必填项不能为空'}],
        classification: [{required: true, trigger: 'change', message: '必填项不能为空'}],
        share: [{required: true, trigger: 'change', message: '必填项不能为空'}],
        area: [{required: true, trigger: 'change', message: '必填项不能为空'}],
        source: [{required: true, trigger: 'change', message: '必填项不能为空'}]
      },

      editorOption: {
        contentType: 'html',
        placeholder: '输入文本...',
        theme: 'snow',
        modules: {
          toolbar: {
            container: [
              ['bold', 'italic', 'underline', 'strike'], // 加粗，斜体，下划线，删除线
              ['blockquote', 'code-block'], // 引用，代码块
              [{header: 1}, {header: 2}], // 标题，键值对的形式；1、2表示字体大小
              [{list: 'ordered'}, {list: 'bullet'}], // 列表
              [{script: 'sub'}, {script: 'super'}], // 上下标
              [{indent: '-1'}, {indent: '+1'}], // 缩进
              [{direction: 'rtl'}], // 文本方向
              [{header: [1, 2, 3, 4, 5, 6, false]}], // 几级标题
              [{color: []}, {background: []}], // 字体颜色，字体背景颜色
              [{align: []}], // 对齐方式
              ['clean'], // 清除字体样式
              ['image', 'video'], // 上传图片、上传视频
            ]
          }
        }
      }
    }
  },
  methods: {
    //表单校验,提交审核----------------------------------------------
    Submit() {
      this.$refs["collectForm"].validate((valid) => {
        if (valid) {
          this.collectForm.keywords = this.collectForm.keywords.map(index => this.keywords[index]);
          this.collectForm.classification = this.categories[this.collectForm.classification];
          this.collectForm.area = this.collectForm.area.map(index => this.areas[index]);
          this.collectForm.source = this.sources[this.collectForm.source];

          let info = {};
          info.title = this.collectForm.title;
          info.category = this.collectForm.classification;
          info.tags = this.collectForm.keywords;
          info.depts = this.collectForm.area;
          info.source = this.collectForm.source;
          info.status = "2";//1 2 3 4草稿 待审核 发布 下线
          info.content = this.content;
          info.id = this.collectForm.id;

          info.lifeTime = dateUtil.LocalToUTC(new Date(this.collectForm.date));
          axios.post(`${baseUrl}/api/knowledge/addKnowledge`,
              info)
          .then(response => {
            console.log(response);
            this.$emit("function", this.param);
            if (response.data.error === 0) {
              ElMessage({
                message: '校验成功，已提交审核',
                type: 'success',
              })
              this.$router.push("/Home")
            } else {
              ElMessage({
                message: '失败',
              })
            }
          })
          .catch((err) => {
            console.log(err.response.request);
            ElMessage({
              message: '标题长度太长，请精简后再提交',
            })
          });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    //退出编辑,存入草稿---------------------------------------------------
    cancel() {
      ElMessageBox.confirm('确认存入草稿箱',
          '提示',
          {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning',
          }).then(() => {
        this.$refs["collectForm"].validate((valid) => {
          if (valid) {
            this.collectForm.keywords = this.collectForm.keywords.map(index => this.keywords[index]);
            this.collectForm.classification = this.categories[this.collectForm.classification];
            this.collectForm.area = this.collectForm.area.map(index => this.areas[index]);
            this.collectForm.source = this.sources[this.collectForm.source];

            let info = {};
            info.title = this.collectForm.title;
            info.category = this.collectForm.classification;
            info.tags = this.collectForm.keywords;
            info.depts = this.collectForm.area;
            info.source = this.collectForm.source;
            info.status = "2";//1 2 3 4草稿 待审核 发布 下线
            info.content = this.content;
            info.id = this.collectForm.id;
            let aDate = new Date(this.collectForm.date);
            info.lifeTime = dateUtil.LocalToUTC(aDate);
            info.id = this.collectForm.id;

            axios.post(`${baseUrl}/api/knowledge/keepDraftKnowledge`, info)
            .then((response) => {
              this.collectForm.id = response.data.item
              console.log(response);
              ElMessage({
                message: '已存入草稿箱',
                type: 'success',
              });
              this.$router.push("/Home")
            })
            .catch(function (err) {
              console.log(err);
            });
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      }).catch(() => {
        ElMessage({
          message: '已退出',
          type: 'success',
        })
      });
    },
    //富文本编辑器函数---------------------------------------------------------------
    onEditorBlur(editor) {
      console.log('editor blur!', editor);
      //获取富文本编辑的html
      this.content = editor.value.firstChild.innerHTML;
    },
    onEditorFocus(editor) {
      console.log('editor focus!', editor);
      this.content = editor.value.firstChild.innerHTML;
    },
    onEditorReady(quill) {
      console.log('editor ready!', quill);
    },
    //自动保存------------------------------------------------------------------------
    saveForm() {
      let info = {};
      info.title = this.collectForm.title;
      info.category = this.categories[this.collectForm.classification];
      info.tags = this.collectForm.keywords.map(index => this.keywords[index]);
      info.depts = this.collectForm.area.map(index => this.areas[index]);
      info.source = this.sources[this.collectForm.source];
      info.status = "2";//1 2 3 4草稿 待审核 发布 下线
      info.content = this.content;
      let aDate = new Date(this.collectForm.date);
      info.lifeTime = dateUtil.LocalToUTC(aDate);
      info.id = this.collectForm.id;
      axios.post(`${baseUrl}/api/knowledge/keepDraftKnowledge`, info)
          .then((response) => {
            this.collectForm.id = response.data.item.id

            ElMessage({
              message: '已自动保存至草稿箱',
              type: 'success',
            });
          })
          .catch(function (err) {
        console.log(err)
      })
    },
    //-----------------------------------------------------------------------
    onTitleChange(value) {
      if (!this.timer && value.trim().length > 0) {
        this.timer = setInterval(this.saveForm, 30000);
      }
    },
  },
  //自动加载调用----------------------------------------------------------------
  mounted() {
    if (store.state.knowledgeId !== null) {
      console.log("知识id", store.state.knowledgeId)
      axios.get(`${baseUrl}/api/knowledge/findByKnowledgeId`, {params: {id: store.state.knowledgeId}})
      .then((response) => {
        console.log(response.data.item)
        this.collectForm = response.data.item
        this.collectForm.title = response.data.item.title;
        this.collectForm.classification = response.data.item.category;
        this.collectForm.keywords = response.data.item.tags;
        this.content = response.data.item.content;
      })
    }
    axios.get(`${baseUrl}/api/tag/findAllTag`)
    .then(response => {
      this.keywords = response.data.list
      this.keywords.forEach((value, index) => value.index = index);
    })
    .catch(function (err) {
      console.log(err);
    });
    axios.get(`${baseUrl}/api/source/findAllSource`)
    .then(response => {
      this.sources = response.data.list
      this.sources.forEach((value, index) => value.index = index);
    })
    .catch(function (err) {
      console.log(err);
    });
    axios.get(`${baseUrl}/api/sysDept/findAllSysDept`)
    .then(response => {
      this.areas = response.data.list;
      this.areas.forEach((value, index) => value.index = index);
    })
    .catch(function (err) {
      console.log(err);
    });
    axios.get(`${baseUrl}/api/category/findSecondCategory`)
    .then(response => {
      let categories = response.data.list;
      categories.forEach((value, index) => value.index = index);
      this.categories = categories
    })
    .catch(function (err) {
      console.log(err);
    });
  },
  //销毁前调用------------------------------------------------------------------
  beforeUnmount() {
    clearInterval(this.timer);
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

.middle {
  padding: 2% 2% 0 2%;
  flex: auto;
  width: 96%;
  height: auto;
}

.bottom {
  padding: 0 1% 1% 1%;
  flex: auto;
  width: 96%;
  height: auto;
}

</style>




