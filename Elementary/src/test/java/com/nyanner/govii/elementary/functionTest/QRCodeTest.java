package com.nyanner.govii.elementary.functionTest;

import com.nyanner.govii.elementary.utils.HtmlToTextUtils;
import com.nyanner.govii.elementary.utils.QRCodeUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;

@SpringBootTest
@Slf4j
public class QRCodeTest {

    @Test
    public void StringBuilderTest() {
        StringBuilder builder = new StringBuilder();
        builder.append("ahdhasdhah");
        log.info("第一次数据{}", builder.subSequence(1, 20));
        builder.append("\n");
        builder.append("爱神的箭啊");
        log.info("第二次数据{}", builder);

    }


    @Test
    public void HtmlToTextTest() {

        String html = "\t<p><b>13.1 本协议包括《用户服务协议》正文以及所有本网站已经发布的或将来可能发布的各类规则、通知、公告等（统称“规则”）。所有规则为本协议不可分割的组成部分，与本协议正文具有同等法律效力。</b></p>  \\r\\n\t\t<p><b>13.2 本协议仅适用于中国电信通过本网站提供的服务，不适用于中国电信通过其他平台（包括但不限于网站、APP等）提供的服务。本网站有权根据法律法规变化和运营需要，不时地制定、修改本协议条款和/或各类规则。本协议及/或各类规则如有任何变更，将以本网站公示方式进行公告，而不再单独通知用户。用户如果不同意相关变更，应立即停止使用本网站提供的网络服务。如果用户继续享用本网站服务，则视为用户对修改后的协议和规则的同意和遵守。</b></p> \\r\\n\\r\\n\t\t<p class=\\\"title\\\">第十四条 法律适用与争议解决</p>\\r\\n\t\t<p>14.1 本协议之效力、解释、变更、履行与争议解决均适用中华人民共和国（为本协议之目的，不含香港、澳门、台湾地区）法律法规。</p>\\r\\n\t\t<p>14.2 因双方就本协议的签订、履行或解释发生争议，双方应持平等、友好、争取合理解决问题的态度协商解决；<b>如协商未成，任何一方均应向中国电信股份有限公司电子渠道运营中心所在地人民法院提起诉讼。</b></p>\\r\\n\t</div>";
        String text = HtmlToTextUtils.getText(html);

        log.info("打印HTML转text的功能:{}", text);
    }


    @Test
    public void QRCodeTest() {
        QRCodeUtil.createCodeToFile("https://www.baidu.com/", new File("D://code"), "1.jpg");
    }

}




















