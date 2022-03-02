# 电信知识库系统

## 前言

本项目是由我们小组gang of seven共七人，在大三上软件工程实训中共同完成的成果。由于缺少开发经验，所以可能会有些处理不太恰当。希望大家可以指出问题，我一定会及时修正。

## 开发背景

电信企业由于产品种类繁多，套餐迭代频繁，计费规则多样，据统计某省产品300多种，套餐数量8000多个，由于套餐迭代而生成的计费规则就达10万多条，对内电信客服中心人员，面对如此众多分布在各系统的规则、业务和政策，客服人员难以记住处理，直接导致了客服人员流失严重。为支撑电信客户服务中心的业务知识管理，希望通过建设一套企业业务知识库系统，完成各项业务的采集、存储、共享等过程。从信息采编收集与服务支撑相关的业务宣传、业界公告等信息，到经过采编整理为可面向客户的信息内容，供客服代表使用，同时将客户反馈的信息传递给公司内部的其他部门作为参考。通过对电信企业知识分类，从“知识采编、知识迭代、知识分享、知识创新”对知识进行全生命周期管理，设计并实现电信企业客服知识管理平台。

## 项目介绍

电信知识库系统基于SpringBoot+MyBatis实现，采用Docker容器化部署。一共设计了6类角色。

**超级管理员**：主要负责账号的创建、角色、权限的分配，登录日志、操作日志的查看处理。



**客服人员**：主要负责处理客户问题，当不清楚业务规则时，使用该系统查询相应的知识。



**知识采编员**：主要负责系统知识的收集、编写到数据库中。



**知识审核员**：主要负责审核知识采编员采编的知识，不通过时要写出驳回理由。



**工单审核员**：主要审核处理一些工单，比如说当客服人员查询相关知识时，发现该系统并没有对应的内容，此时可以发起工单，待工单审核通过时，交由知识采编员采编相关的知识。



**反馈处理员**：主要负责处理一些客服等人员的反馈，当有人反馈相关的知识过时、或者内容出现错误时，反馈处理员进行处理。



## 项目演示

**项目演示地址：**  [http://101.43.204.78:8081/](http://101.43.204.78:8081/)

域名暂时还未申请下来，在努力申请中......

账号：admin       密码：admin123

admin账号对应的角色是超级管理员，给予了所有的权限。

所以其他角色的账号密码就不给了。



**项目源码：** [https://github.com/shmily-deep/gang-of-seven](https://github.com/shmily-deep/gang-of-seven)



![image-20220302211503516](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302211503516.png)



![image-20220302211536932](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302211536932.png)



![image-20220302211830755](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302211830755.png)





![image-20220302211855746](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302211855746.png)

![image-20220302211922413](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302211922413.png)

![image-20220302211952121](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302211952121.png)







![image-20220302212022052](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302212022052.png)









![image-20220302212042451](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302212042451.png)







![image-20220302212127565](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302212127565.png)







![image-20220302212302679](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302212302679.png)





![image-20220302212359436](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302212359436.png)



![image-20220302212444900](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302212444900.png)



![image-20220302212504455](https://gitee.com/shmily-deep/my-information/raw/master//image/image-20220302212504455.png)





## 技术选型

### 后端技术

| 技术 | 说明 | 官网 |
| :--: | :--: | :--: |
|      |      |      |
|      |      |      |
|      |      |      |



