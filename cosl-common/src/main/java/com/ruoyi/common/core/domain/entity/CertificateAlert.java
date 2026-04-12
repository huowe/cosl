package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 证书到期提醒对象
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
public class CertificateAlert implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 提醒类型：EXPIRING_SOON-即将到期, EXPIRED-已过期 */
    private String type;

    /** 提醒标题 */
    private String title;

    /** 提醒内容 */
    private String content;

    /** 提醒说明 */
    private String description;

    /** 提醒时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date alertTime;

    /** 人员列表 */
    private List<CertificatePerson> persons;

    /** 数量 */
    private Integer count;

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public Date getAlertTime()
    {
        return alertTime;
    }

    public void setAlertTime(Date alertTime)
    {
        this.alertTime = alertTime;
    }

    public List<CertificatePerson> getPersons()
    {
        return persons;
    }

    public void setPersons(List<CertificatePerson> persons)
    {
        this.persons = persons;
    }

    public Integer getCount()
    {
        return count;
    }

    public void setCount(Integer count)
    {
        this.count = count;
    }

    /**
     * 证书到期人员信息
     */
    public static class CertificatePerson implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 人员ID */
        private Long personId;

        /** 姓名 */
        private String name;

        /** 证书到期日期 */
        @JsonFormat(pattern = "yyyy-MM-dd")
        private Date certificateExpireDate;

        /** 过期天数（正数表示已过期天数，负数表示即将到期天数） */
        private Integer expiredDays;

        /** 职位 */
        private String position;

        /** 公司 */
        private String company;

        public Long getPersonId()
        {
            return personId;
        }

        public void setPersonId(Long personId)
        {
            this.personId = personId;
        }

        public String getName()
        {
            return name;
        }

        public void setName(String name)
        {
            this.name = name;
        }

        public Date getCertificateExpireDate()
        {
            return certificateExpireDate;
        }

        public void setCertificateExpireDate(Date certificateExpireDate)
        {
            this.certificateExpireDate = certificateExpireDate;
        }

        public Integer getExpiredDays()
        {
            return expiredDays;
        }

        public void setExpiredDays(Integer expiredDays)
        {
            this.expiredDays = expiredDays;
        }

        public String getPosition()
        {
            return position;
        }

        public void setPosition(String position)
        {
            this.position = position;
        }

        public String getCompany()
        {
            return company;
        }

        public void setCompany(String company)
        {
            this.company = company;
        }
    }
}
