package com.ruoyi.system.domain;

import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 人员步态表 person_gait
 * 
 * @author ruoyi
 */
public class PersonGait extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 人员 ID */
    @Excel(name = "人员 ID", cellType = ColumnType.NUMERIC)
    private Long personId;

    /** 摄像头 ID */
    @Excel(name = "摄像头 ID", cellType = ColumnType.NUMERIC)
    private Long cameraId;

    /** 步态图片 URL */
    @Excel(name = "步态图片 URL")
    private String gaitImageUrl;

    /** 剪影 URL */
    @Excel(name = "剪影 URL")
    private String silhouetteUrl;

    /** 抓拍时间 */
    @Excel(name = "抓拍时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date captureTime;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getPersonId()
    {
        return personId;
    }

    public void setPersonId(Long personId)
    {
        this.personId = personId;
    }

    public Long getCameraId()
    {
        return cameraId;
    }

    public void setCameraId(Long cameraId)
    {
        this.cameraId = cameraId;
    }

    @Size(min = 0, max = 255, message = "步态图片 URL 不能超过 255 个字符")
    public String getGaitImageUrl()
    {
        return gaitImageUrl;
    }

    public void setGaitImageUrl(String gaitImageUrl)
    {
        this.gaitImageUrl = gaitImageUrl;
    }

    @Size(min = 0, max = 255, message = "剪影 URL 不能超过 255 个字符")
    public String getSilhouetteUrl()
    {
        return silhouetteUrl;
    }

    public void setSilhouetteUrl(String silhouetteUrl)
    {
        this.silhouetteUrl = silhouetteUrl;
    }

    public Date getCaptureTime()
    {
        return captureTime;
    }

    public void setCaptureTime(Date captureTime)
    {
        this.captureTime = captureTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("personId", getPersonId())
            .append("cameraId", getCameraId())
            .append("gaitImageUrl", getGaitImageUrl())
            .append("silhouetteUrl", getSilhouetteUrl())
            .append("captureTime", getCaptureTime())
            .toString();
    }
}
