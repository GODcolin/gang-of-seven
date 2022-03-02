package com.nyanner.govii.elementary.functionTest;

import com.nyanner.govii.elementary.utils.QiniuUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;

@SpringBootTest
@Slf4j
public class QiniuUtilsTest {

    @Autowired
    QiniuUtils qiniuUtils;

    @Test
    void uploadFileTest() {
        File file = new File("D:\\我的文档\\2033279818\\FileRecv\\hah.mp4");
        String path = qiniuUtils.uploadFile(file, "测试上传视频功能");
        log.info("打印文件上传路径:{}", path);
    }
}
