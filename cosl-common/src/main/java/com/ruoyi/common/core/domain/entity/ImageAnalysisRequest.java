package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * 图片分析请求对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ImageAnalysisRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 图片base64，和url传一个即可，base64优先级更高。请使用RFC4648标准的base64 */
    private String imageBase64;

    /** 图片url，和base64传一个即可，base64优先级更高 */
    private String url;
}
