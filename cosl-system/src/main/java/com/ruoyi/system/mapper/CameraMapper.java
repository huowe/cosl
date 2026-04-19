package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.common.core.domain.entity.Camera;

/**
 * 摄像头 Mapper 接口
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
public interface CameraMapper
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
     * 删除摄像头
     * 
     * @param id 摄像头 ID
     * @return 结果
     */
    public int deleteCameraById(Long id);

    /**
     * 批量删除摄像头
     * 
     * @param ids 需要删除的数据 ID
     * @return 结果
     */
    public int deleteCameraByIds(Long[] ids);

    /**
     * 校验 IP 地址是否唯一
     * 
     * @param ip IP 地址
     * @return 结果
     */
    public Camera checkIpUnique(String ip);

    /**
     * 根据楼层查询摄像头列表
     * 
     * @param floor 楼层
     * @return 摄像头列表
     */
    public List<Camera> selectCamerasByFloor(String floor);

    /**
     * 统计摄像头总数
     * 
     * @return 摄像头总数
     */
    public int countCameraTotal();

    /**
     * 统计开启的摄像头数
     * 
     * @return 开启的摄像头数
     */
    public int countCameraOnline();

    /**
     * 根据摄像机ID查询摄像机
     * 
     * @param cameraId 摄像机ID
     * @return 摄像机
     */
    public Camera selectCameraByCameraId(String cameraId);
}
