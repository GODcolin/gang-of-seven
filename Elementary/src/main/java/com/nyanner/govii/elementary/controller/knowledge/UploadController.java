package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.utils.QiniuUtils;
import com.nyanner.govii.elementary.vo.RestResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@RestController
@RequestMapping("/api/upload")
public class UploadController {
    @Autowired
    QiniuUtils qiniuUtils;

    @PostMapping
    public RestResponse upload(MultipartFile file) {
        //原始文件名称
        String originalFilename = file.getOriginalFilename();

        //保证文件名称唯一
        String fileName = UUID.randomUUID().toString() + "." + StringUtils.substringAfter(originalFilename, ".");

        return qiniuUtils.uploadFile(file, fileName);
    }


}



