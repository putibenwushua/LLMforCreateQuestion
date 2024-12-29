package com.exam.exception;

import com.exam.entity.ApiResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * ClassName: GlobalExceptionHandler
 * Package: com.exam.exception
 * Description:
 *
 * @version 1.0
 * @Author 中科院软件所-智能博弈-刘鹏翔
 * @Create 2024/12/28 19:44
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
    // 处理全局异常
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ApiResult handleSpecificExceptions(Exception ex) {
        System.out.println("...处理全局异常...");
        ApiResult apiResult = new ApiResult();
        apiResult.setMessage("请求处理过程中发生了特定异常: " + ex.getMessage());
        apiResult.setCode(HttpStatus.BAD_REQUEST.value());
        return apiResult;
    }
}
