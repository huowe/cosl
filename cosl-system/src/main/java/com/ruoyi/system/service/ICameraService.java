package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.Camera;

/**
 * 摄像头 Service 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface ICameraService
{
    /**
     * 查询摄像头
     * 
     * @param id 摄像头 ID
     * @return 摄像头
     */
    public Camera selectCameraById(Long id);

    /**
     * 查询摄像头列表
     * 
     * @param camera 摄像头
     * @return 摄像头集合
     */
    public List<Camera> selectCameraList(Camera camera);

    /**
     * 新增摄像头
     * 
     * @param camera 摄像头
     * @return 结果
     */
    public int insertCamera(Camera camera);

    /**
     * 修改摄像头
     * 
     * @param camera 摄像头
     * @return 结果
     */
    public int updateCamera(Camera camera);

    /**
     * 批量删除摄像头
     * 
     * @param ids 需要删除的摄像头 ID
     * @return 结果
     */
    public int deleteCameraByIds(String ids);

    /**
     * 删除摄像头
     * 
     * @param id 摄像头 ID
     * @return 结果
     */
    public int deleteCameraById(Long id);

    /**
     * 校验 IP 地址是否唯一
     * 
     * @param camera 摄像头
     * @return 结果
     */
    public boolean checkIpUnique(Camera camera);

    /**
     * 根据楼层查询摄像头列表
     * 
     * @param floor 楼层
     * @return 摄像头列表
     */
    public List<Camera> selectCamerasByFloor(String floor);

    /**
     * 更新摄像头位置
     *
     * @param id 摄像头 ID
     * @param xAxis X 轴坐标
     * @param yAxis Y 轴坐标
     * @return 结果
     */
    public int updatePosition(Long id, Double xAxis, Double yAxis);

    /**
     * 清除摄像头位置
     *
     * @param id 摄像头 ID
     * @return 结果
     */
    public int clearPosition(Long id);

}
