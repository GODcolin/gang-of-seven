package com.nyanner.govii.elementary.utils;

import com.alibaba.fastjson.JSON;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Component
@Slf4j
public class QiniuUtils {

    @Autowired
    UploadManager uploadManager;
    @Autowired
    Auth auth;
    @Value("${qiniu.bucketname}")
    private String bucket;
    @Value("${qiniu.domain}")
    private String domain;

    public String uploadFile(File file, String fileName) {

        //上传凭证
        String upToken = auth.uploadToken(bucket);
        Response response = null;
        try {
            response = uploadManager.put(file, fileName, upToken);
            //解析上传的结果
            DefaultPutRet defaultPutRet = JSON.parseObject(response.bodyString(), DefaultPutRet.class);
            String path = domain + "/" + fileName;
            log.info("上传文件成功");
            return path;

        } catch (QiniuException e) {
            Response r = e.response;
            log.info("上传文件错误", r);
        }
        return "上传失败";
    }

    public RestResponse uploadFile(MultipartFile file, String fileName) {
        //上传凭证
        String upToken = auth.uploadToken(bucket);
        Response response = null;
        try {
            byte[] uploadBytes = file.getBytes();
            response = uploadManager.put(uploadBytes, fileName, upToken);
            //解析上传的结果
            DefaultPutRet defaultPutRet = JSON.parseObject(response.bodyString(), DefaultPutRet.class);
            String path = domain + "/" + fileName;
            log.info("上传文件成功");
            return RestResponse.ok(path).msg("文件上传成功");

        } catch (QiniuException e) {
            Response r = e.response;
            log.info("上传文件错误", r);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return RestResponse.fail().msg("文件上传失败");

    }
}











