package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 人员信息对象 person
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Data
public class Person implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 姓名 */
    private String name;

    /** MTS 卡号 */
    private String mtsCardNo;

    /** 身份证号 */
    private String idCard;

    /** 公司 */
    private String company;

    /** 职位 */
    private String position;

    private List<String> positions;

    /** 证书到期日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date certificateExpireDate;

    /**  onboard 日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date onboardDate;

    /** 离职日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date leaveDate;

    /** 房间 ID */
    private Long roomId;

    /** 床位 ID */
    private Long bedId;

    /** 救生艇 ID */
    private Long lifeboatId;

    /** 状态 ONBOARD/TRANSFER/LEFT */
    private String status;

    /** 黑名单标志 0-否 1-是 */
    private Integer blacklistFlag;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /** 删除标志 0-未删除 1-已删除 */
    private Integer deleted;

    private String monitorId;

    /** 是否已确认步态特征 0-未确认 1-已确认 */
    private Integer gaitFeatureConfirmed;

    private String image;

    private String collectStartTime;

    private String collectEndTime;
}
