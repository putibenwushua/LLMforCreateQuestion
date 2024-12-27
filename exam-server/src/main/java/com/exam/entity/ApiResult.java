package com.exam.entity;

import lombok.Data;

@Data
public class ApiResult<T> {
    /**
     * 错误码，表示一种错误类型
     * 请求成功，状态码为200
     */
    private int code;
    /**
     * 对错误代码的详细解释
     */
    private String message;
    /**
     * 返回的结果
     */
    private T data;
}
