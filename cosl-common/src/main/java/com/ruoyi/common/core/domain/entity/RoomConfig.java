package com.ruoyi.common.core.domain.entity;

import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 房间配置对象 room_config
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public class RoomConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 房间号 */
    @Excel(name = "房间号")
    private String roomNo;

    /** 楼层 */
    @Excel(name = "楼层")
    private String floor;

    /** 总床位数 */
    @Excel(name = "总床位数", cellType = ColumnType.NUMERIC)
    private Integer totalBeds;
    @Excel(name = "状态")
    private String status;

    private List<RoomBed> bedList;

    public List<RoomBed> getBedList() {
        return bedList;
    }
    public void setBedList(List<RoomBed> bedList) {
        this.bedList = bedList;
    }


    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    @NotBlank(message = "房间号不能为空")
    @Size(min = 0, max = 20, message = "房间号长度不能超过20个字符")
    public String getRoomNo()
    {
        return roomNo;
    }

    public void setRoomNo(String roomNo) 
    {
        this.roomNo = roomNo;
    }

    @Size(min = 0, max = 10, message = "楼层长度不能超过10个字符")
    public String getFloor()
    {
        return floor;
    }

    public void setFloor(String floor) 
    {
        this.floor = floor;
    }

    @NotNull(message = "总床位数不能为空")
    @Min(value = 0, message = "总床位数不能小于 0")
    public Integer getTotalBeds()
    {
        return totalBeds;
    }

    public void setTotalBeds(Integer totalBeds) 
    {
        this.totalBeds = totalBeds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("roomNo", getRoomNo())
            .append("floor", getFloor())
            .append("totalBeds", getTotalBeds())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
