package com.nyanner.govii.elementary.service.user;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.nyanner.govii.elementary.service.infa.CaptchaService;
import com.nyanner.govii.elementary.utils.RedisUtils;
import com.nyanner.govii.elementary.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
public class CaptchaServiceImpl implements CaptchaService {
    private final DefaultKaptcha producer;
    private final RedisUtils redisUtils;
    private final UUIDUtil uuidUtil;
    //从SpringBoot的配置文件中取出过期时间
    @Value("${govii.app.captcha.timeout}")
    private Long timeout;

    public CaptchaServiceImpl(DefaultKaptcha producer, RedisUtils redisUtils, UUIDUtil uuidUtil) {
        this.producer = producer;
        this.redisUtils = redisUtils;
        this.uuidUtil = uuidUtil;
    }

    //UUID为key, 验证码为Value放在Redis中
    public Map<String, Object> createToken(String captcha) {

        //生成一个token
        String key = uuidUtil.getUUID32();
        //生成验证码对应的token  以token为key  验证码为value存在redis中
        redisUtils.set(key, captcha);
        //设置验证码过期时间
        redisUtils.expire(key, timeout, TimeUnit.MINUTES);
        Map<String, Object> map = new HashMap<>();
        map.put("token", key);
        map.put("expire", timeout);
        return map;
    }

    private Map<String, Object> catchaImgCreator() throws IOException {
        //生成文字验证码
        String text = producer.createText();
        //生成文字对应的图片验证码
        BufferedImage image = producer.createImage(text);
        //将图片写出
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(image, "jpg", outputStream);

//        var fos = new FileOutputStream("C:\\Users\\liu\\Desktop\\test.jpg", true);
//        outputStream.writeTo(fos);
//        fos.close();

        //对写出的字节数组进行Base64编码 ==> 用于传递8比特字节码
        var encoder = Base64.getEncoder();
        //生成token
        Map<String, Object> token = createToken(text);
        token.put("img", "data:image/jpeg;base64," + encoder.encodeToString(outputStream.toByteArray()));
        return token;
    }

    public Map<String, Object> captchaCreator() throws IOException {
        return catchaImgCreator();
    }
    //验证输入的验证码是否正确

    public Boolean versifyCaptcha(String token, String inputCode) {
        //根据前端传回的token在redis中找对应的value
        if (redisUtils.hasKey(token)) {
            //验证通过, 删除对应的key
            if (redisUtils.get(token).equals(inputCode)) {
                redisUtils.delete(token);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }


}