package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
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
public class Person implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

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

    private List<String> positions;

    private String faceImageUrl;

    private String gaitId;

    public String getFaceImageUrl() {
        return faceImageUrl;
    }
    public void setFaceImageUrl(String faceImageUrl) {
        this.faceImageUrl = faceImageUrl;
    }

    public List<String> getPositions() {
        return positions;
    }
    public void setPositions(List<String> positions) {
        this.positions = positions;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public void setMtsCardNo(String mtsCardNo)
    {
        this.mtsCardNo = mtsCardNo;
    }

    public String getMtsCardNo()
    {
        return mtsCardNo;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setCompany(String company)
    {
        this.company = company;
    }

    public String getCompany()
    {
        return company;
    }

    public void setPosition(String position)
    {
        this.position = position;
    }

    public String getPosition()
    {
        return position;
    }

    public void setCertificateExpireDate(Date certificateExpireDate)
    {
        this.certificateExpireDate = certificateExpireDate;
    }

    public Date getCertificateExpireDate()
    {
        return certificateExpireDate;
    }

    public void setOnboardDate(Date onboardDate)
    {
        this.onboardDate = onboardDate;
    }

    public Date getOnboardDate()
    {
        return onboardDate;
    }

    public void setLeaveDate(Date leaveDate)
    {
        this.leaveDate = leaveDate;
    }

    public Date getLeaveDate()
    {
        return leaveDate;
    }

    public void setRoomId(Long roomId)
    {
        this.roomId = roomId;
    }

    public Long getRoomId()
    {
        return roomId;
    }

    public void setBedId(Long bedId)
    {
        this.bedId = bedId;
    }

    public Long getBedId()
    {
        return bedId;
    }

    public void setLifeboatId(Long lifeboatId)
    {
        this.lifeboatId = lifeboatId;
    }

    public Long getLifeboatId()
    {
        return lifeboatId;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    public void setBlacklistFlag(Integer blacklistFlag)
    {
        this.blacklistFlag = blacklistFlag;
    }

    public Integer getBlacklistFlag()
    {
        return blacklistFlag;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
    }

    public Date getUpdateTime()
    {
        return updateTime;
    }

    public void setDeleted(Integer deleted)
    {
        this.deleted = deleted;
    }

    public Integer getDeleted()
    {
        return deleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("mtsCardNo", getMtsCardNo())
            .append("idCard", getIdCard())
            .append("company", getCompany())
            .append("position", getPosition())
            .append("certificateExpireDate", getCertificateExpireDate())
            .append("onboardDate", getOnboardDate())
            .append("leaveDate", getLeaveDate())
            .append("roomId", getRoomId())
            .append("bedId", getBedId())
            .append("lifeboatId", getLifeboatId())
            .append("status", getStatus())
            .append("blacklistFlag", getBlacklistFlag())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("deleted", getDeleted())
            .toString();
    }
}
