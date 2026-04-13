package com.ruoyi.system.domain;

import java.util.List;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 摄像机查询请求对象
 * 
 * @author ruoyi
 */
@Data
public class CameraQueryRequest extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 摄像机分组id列表 */
    private List<String> cameraGroupIds;

    /** 摄像机id列表，根据id查询 */
    private List<String> cameraIds;

    /** 抓拍状态 (WAIT:等待, STOP:停止, DETECTING:正在检测, FAIL:失败 , WAIT_CONFIRM:等待确认, HUNG:挂起) */
    private String cameraStatus;

    /** 摄像机类型 NORMAL:普通 GB:国标 */
    private String cameraType;

    /** 设备id */
    private String deviceId;

    /** 根据设备名称或ip过滤 */
    private String deviceNameOrIp;

    /** 是否启用 */
    private Boolean isEnable;

    /** 页码，默认为1 */
    private Integer pageNo;

    /** 每页数量, 默认为10 */
    private Integer pageSize;
}
