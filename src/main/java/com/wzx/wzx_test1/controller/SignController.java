package com.wzx.wzx_test1.controller;

import com.wzx.wzx_test1.annotation.UserLoginToken;
import com.wzx.wzx_test1.mapper.UserMapper;
import com.wzx.wzx_test1.model.Captcha;
import com.wzx.wzx_test1.model.User;
import com.wzx.wzx_test1.service.SignService;
import com.wzx.wzx_test1.service.TokenService;
import com.wzx.wzx_test1.utils.CommonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api")
public class SignController {
    private static final Logger logger = LoggerFactory.getLogger(SignController.class);

    @Autowired
    SignService signService;
    @Autowired
    TokenService tokenService;
    @Autowired
    UserMapper userMapper;

    @RequestMapping("getAuthCode")
    @ResponseBody
    public CommonResult<Captcha> getAuthCode(HttpServletRequest request, HttpServletResponse response) {
        logger.info("getAuthCode");
        return CommonResult.successReturn(signService.createCaptcha(request, response));
    }


    @RequestMapping("getCurrentUser")
    @ResponseBody
    public CommonResult<User> getCurrentUser(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        return CommonResult.successReturn(userMapper.getOne(session.getAttribute("id").toString()));
    }

//    @UserLoginToken
//    @RequestMapping("getCurrentUser")
//    @ResponseBody
//    public CommonResult<User> getCurrentUser(HttpServletRequest request, HttpServletResponse response) {
//        String token = request.getHeader("token");
//        return CommonResult.successReturn(userMapper.getOne(JWT.decode(token).getAudience().get(0)));
//    }


    @RequestMapping("userLogin")
    @ResponseBody
    public CommonResult<String> userLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response, String userName, String password, String verCode) {
        logger.info("userLogin");
        logger.info("userName: " + userName);
        logger.info(password);
        logger.info(verCode);
        Integer state = signService.checkLogin(session, request, response, userName, password, verCode);
        if (state < 0) {
            return CommonResult.errorReturn(state == -1 ? "验证码错误" : "用户名或密码错误");
        } else {
            String token = tokenService.getToken(userMapper.getOne(userName));
            return CommonResult.successReturn(token, state == 1 ? "business_homepage.html" : "/");
        }

    }

    @RequestMapping("logout")
    @ResponseBody
    public CommonResult<String> logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        signService.checkLogout(session, request, response);
        return CommonResult.successReturn("0");
    }

    @UserLoginToken
    @GetMapping("/getMessage")
    @ResponseBody
    public String getMessage() {
        return "你已通过验证";
    }


}
