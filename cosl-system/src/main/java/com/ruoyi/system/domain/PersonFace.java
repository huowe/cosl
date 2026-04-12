package com.ruoyi.system.domain;

import java.util.Date;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 人员人脸表 person_face
 * 
 * @author ruoyi
 */
public class PersonFace extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 钻井平台编号 */
    private String platformNo;

    /** 人员 ID */
    @Excel(name = "人员 ID", cellType = ColumnType.NUMERIC)
    private Long personId;

    /** 图片 URL */
    @Excel(name = "图片 URL")
    private String imageUrl;

    /** 特征数据 */
    private byte[] featureData;

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

    @Size(min = 0, max = 255, message = "图片 URL 不能超过 255 个字符")
    public String getImageUrl()
    {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }

    public byte[] getFeatureData()
    {
        return featureData;
    }

    public void setFeatureData(byte[] featureData)
    {
        this.featureData = featureData;
    }

    public void setPlatformNo(String platformNo)
    {
        this.platformNo = platformNo;
    }

    public String getPlatformNo()
    {
        return platformNo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("personId", getPersonId())
            .append("imageUrl", getImageUrl())
            .append("featureData", getFeatureData())
            .append("createTime", getCreateTime())
            .toString();
    }
}
