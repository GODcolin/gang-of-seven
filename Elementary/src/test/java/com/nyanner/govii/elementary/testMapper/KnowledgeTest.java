package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Category;
import com.nyanner.govii.elementary.entity.knowledge.Knowledge;
import com.nyanner.govii.elementary.entity.knowledge.Source;
import com.nyanner.govii.elementary.entity.knowledge.Widget;
import com.nyanner.govii.elementary.mapper.KnowledgeMapper;
import com.nyanner.govii.elementary.mapper.WidgetMapper;
import com.nyanner.govii.elementary.model.bean.*;
import com.nyanner.govii.elementary.model.bean.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class KnowledgeTest {

    @Autowired
    KnowledgeMapper knowledgeMapper;

    @Autowired
    WidgetMapper widgetMapper;

    @Test
    public void selectHotKnowledgeTest() {
        List<KnowledgeIdAndTitle> knowledgeList = knowledgeMapper.selectHotKnowledge(5, 30);
        knowledgeList.forEach(e -> System.out.println(e));
    }

    @Test
    public void selectKnowledgeByLikes() {
        List<KnowledgeIdAndTitle> knowledgeList = knowledgeMapper.selectKnowledgeByLikes(5, 30);
        knowledgeList.forEach(e -> System.out.println(e));
    }

    @Test
    public void selectKnowledgeByCollect() {
        List<KnowledgeIdAndTitle> knowledgeList = knowledgeMapper.selectKnowledgeByCollect(5, 7);
        knowledgeList.forEach(e -> System.out.println(e));
    }

    @Test
    public void selectNewKnowledgeTest() {
        List<KnowledgeIdAndTitleAndTime> knowledgeList = knowledgeMapper.selectNewKnowledge(5);
        knowledgeList.forEach(e -> System.out.println(e));
    }

    @Test
    void searchKnowledgeInfoTest() {
        List<SearchKnowledge> knowledges = knowledgeMapper.searchKnowledgeInfo("5G");
        knowledges.forEach(e -> log.info("查询基础知识信息:{}", e));
    }

    @Test
    public void addKnowledgeTest() {
        Knowledge knowledge = new Knowledge();
        knowledge.setTitle("第二版测试");
        knowledge.setAuthorId(2L);
        Category category = new Category();
        category.setId(5L);
        category.setCategoryName("套餐使用");
        knowledge.setCategory(category);

        Source source = new Source();
        source.setId(2L);
        source.setName("人民网");
        knowledge.setSource(source);
        knowledge.setContent("今天是个好日子");
        knowledge.setMasterId(56L);
        knowledgeMapper.addKnowledge(knowledge);
    }

    @Test
    void selectKnowledgeByUserTest() {
        List<IndividualKnowledge> knowledges = knowledgeMapper.selectKnowledgeByUser(1L, "2");
        knowledges.forEach(e -> log.info("查询用户id为1L的知识内容: {}", e));
    }

    @Test
    void selectAuditingKnowledgeTest() {
        List<KnowledgeAudit> knowledgeAudits = knowledgeMapper.selectAuditingKnowledge();
        knowledgeAudits.forEach(e -> log.info("查询待审核知识的信息: {}", e));
    }

    @Test
    void addWidgeTest() {
        Widget widget = new Widget();
        widgetMapper.addWidget(widget);
        log.info("用户id{}", widget.getId());
    }

    @Test
    void updateKnowledgeVersionTest() {
        knowledgeMapper.updateKnowledgeVersion(56L);
    }

    @Test
    void selectKnowledgeDetailsByKnowledgeIdTest() {
        Knowledge knowledge = knowledgeMapper.selectKnowledgeDetailsByKnowledgeId(485L);
        log.info("打印知识id为485L的详细信息:{}", knowledge);
    }

    @Test
    void updateKnowledgeByIdTest() {
        int i = knowledgeMapper.updateKnowledgeStatusById(86L, "3");
        log.info("修改知识id为86L的状态:{}", i);
    }

    @Test
    void selectKnowledgeVersionsTest() {
        List<SearchKnowledge> searchKnowledges = knowledgeMapper.selectKnowledgeVersions(56L);
        searchKnowledges.forEach(e -> log.info("打印系列号为56的历史版本信息:{}", e));
    }

    @Test
    void selectKnowledgeByCategoryIdTest() {
        List<SearchKnowledge> searchKnowledges = knowledgeMapper.selectKnowledgeByCategoryId(24L);
        searchKnowledges.forEach(e -> log.info("打印类别id为24的知识:{}", e));
    }


    @Test
    public void findAll() {
        List<Knowledge> knowledges = knowledgeMapper.findAll();
        knowledges.forEach(e -> log.info("查询所有知识信息:{}", e));
    }


    @Test
    public void selectKnowledgeByIdTest() {

    }

    @Test
    void selectKnowledgeByStrTest() {
        List<SearchKnowledge> lists = knowledgeMapper.searchKnowledgeInfo("用户");
        lists.forEach(e -> log.info("实现标题、内容模糊查询{}", e));
    }


    @Test
    public void updateKnowledgeBodyIdTest() {

    }


    @Test
    public void advancedSearchKnowledgeTest() {
        KnowledgeParams knowledgeParams = new KnowledgeParams();
        knowledgeParams.setKeyWords("流量");
        List<SearchKnowledge> searchKnowledges = knowledgeMapper.advancedSearchKnowledge(knowledgeParams);
        searchKnowledges.forEach(e -> log.info("打印高级搜索知识:{}", e));
    }


    @Test
    public void selectAuditedKnowledgeTest() {
        List<KnowledgeAudit> searchKnowledges = knowledgeMapper.selectAuditedKnowledge(1L, "");
        searchKnowledges.forEach(e -> log.info("测试已经通过审核的知识:{}", e));
    }

    @Test
    public void selectRandomKnowledgeTest() {
        List<SearchKnowledge> searchKnowledges = knowledgeMapper.selectRandomKnowledge(5);
        searchKnowledges.forEach(e -> log.info("随机推荐的知识:{}", e));
    }

    @Test
    public void shareKnowledgeByIdTest() {
        KnowledgeIdAndTitleAndContent knowledgeIdAndTitleAndContent = knowledgeMapper.shareKnowledgeById(11L);
        log.info("打印分享的知识:{}", knowledgeIdAndTitleAndContent);
    }


//    @Test
//    public void selectKnowledgeManageInfoTest(){
//        List<KnowledgeManageInfo> knowledgeManageInfos = knowledgeMapper.selectKnowledgeManageInfo(KnowledgeManageInfo knowledgeManageInfo);
//        knowledgeManageInfos.forEach(e -> log.info("打印知识管理信息:{}",e));
//
//    }

    @Test
    public void updateKnowledgeTest() {
        Knowledge knowledge = new Knowledge();
        knowledge.setId(100L);
        knowledge.setContent("阿莎");
        int i = knowledgeMapper.updateKnowledge(knowledge);
        log.info("更新知识{}", i);
    }

    @Test
    public void selectRandomKnowledgeByCategoryIdTest(){
        SearchKnowledge knowledge = knowledgeMapper.selectRandomKnowledgeByCategoryId(2L);
        log.info("查询根据类别id随机推荐的知识:{}",knowledge);
    }


}
