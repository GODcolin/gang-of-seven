package com.nyanner.govii.elementary.Algorithm;

import com.nyanner.govii.elementary.model.bean.UserLikeCategory;

import java.util.ArrayList;
import java.util.List;

public class RecommendAlgorithm {

    //个性推荐
    public Long recommend (List<UserLikeCategory> userLikeCategories,List<UserLikeCategory> userCollectionCategories){
        //找到一个用户的所有点赞内容，查出其所有的知识对应的类别id，放到一个list,其中统计知识分类个数,计算了每个类别的数量
        Long categoryId;
        //合并用户的点赞和收藏的操作数量
        List<Integer> leftCollectionCategories = new ArrayList<>(); //存储收藏存在但点在不存在的类别id
        for (int i = 0; i < userLikeCategories.size(); i++) {
            Long tempUserLikeCategoriesId = userLikeCategories.get(i).getId();
            for (int j = 0; j < userCollectionCategories.size(); j++) {
                if (tempUserLikeCategoriesId == userCollectionCategories.get(j).getId()) {
                    userLikeCategories.get(i).setCount(
                            userLikeCategories.get(i).getCount()+userCollectionCategories.get(i).getCount());
                }else {
                    leftCollectionCategories.add(j);
                }
            }
        }
        for (int i = 0; i < leftCollectionCategories.size(); i++) {
            userLikeCategories.add(userCollectionCategories.get(leftCollectionCategories.get(i)));
        }
        //轮盘赌随机推荐
        int likeSum = 0;
        int userLikeCategoriesSize = userLikeCategories.size();
        //求用户对某一类别操作的总数
        for (int i = 0; i < userLikeCategoriesSize; i++) {
            likeSum += userLikeCategories.get(i).getCount();
        }
        //求每一个类别所占比例及累积概率
        double cumulativeProbability = 0;
        double random = Math.random();
        for (int i = 0; i < userLikeCategoriesSize; i++) {
            userLikeCategories.get(i).setPercent((double) userLikeCategories.get(i).getCount()/likeSum);
            cumulativeProbability += userLikeCategories.get(i).getPercent();
            if ( i > 0 ) {
                if (random < cumulativeProbability &&
                        random >= userLikeCategories.get(i-1).getCumulativeProbability() ) {
                    categoryId = userLikeCategories.get(i).getId();
                    return categoryId;
                }
            }
            else {
                if (random < cumulativeProbability) {
                    categoryId = userLikeCategories.get(i).getId();
                    return categoryId;
                }
            }
            userLikeCategories.get(i).setCumulativeProbability(cumulativeProbability);
        }
        return -1L;
    }

}
