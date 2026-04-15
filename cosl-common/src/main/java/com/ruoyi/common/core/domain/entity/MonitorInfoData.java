package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * 底库人员信息数据对象
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class MonitorInfoData implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 底库人员年龄 */
    private Integer age;

    /** 创建时间 */
    private String createTime;

    /** 底库人员性别 -1 不确定，0 男，1 女 */
    private Integer genderCode;

    /** 底库人员证件号 */
    private String idCard;

    /** 底库人员id */
    private String monitorId;

    /** 底库人员姓名 */
    private String name;

    /** 预览图 */
    private String previewImageUrl;

    /** 底库id */
    private String repositoryId;

    /** 底库名 */
    private String repositoryName;

    /** 底库人员性别(过期字段) 0未知 1男 2女 */
    private Integer sex;
}
