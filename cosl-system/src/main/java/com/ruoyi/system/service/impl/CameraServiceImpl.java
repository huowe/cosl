package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.domain.entity.Camera;
import com.ruoyi.system.mapper.CameraMapper;
import com.ruoyi.system.service.ICameraService;

/**
 * 摄像头 Service 业务层处理
 * 
 * @author ruoyi
 * @date 2026-03-07
 */
@Service
public class CameraServiceImpl implements ICameraService
{
    @Autowired
    private CameraMapper cameraMapper;

    /**
     * 查询摄像头
     * 
     * @param id 摄像头 ID
     * @return 摄像头
     */
    @Override
    public Camera selectCameraById(Long id)
    {
        return cameraMapper.selectCameraById(id);
    }

    /**
     * 查询摄像头列表
     * 
     * @param camera 摄像头
     * @return 摄像头
     */
    @Override
    public List<Camera> selectCameraList(Camera camera)
    {
        return cameraMapper.selectCameraList(camera);
    }

    /**
     * 新增摄像头
     * 
     * @param camera 摄像头
     * @return 结果
     */
    @Override
    public int insertCamera(Camera camera)
    {
        return cameraMapper.insertCamera(camera);
    }

    /**
     * 修改摄像头
     * 
     * @param camera 摄像头
     * @return 结果
     */
    @Override
    public int updateCamera(Camera camera)
    {
        return cameraMapper.updateCamera(camera);
    }

    /**
     * 批量删除摄像头
     * 
     * @param ids 需要删除的摄像头 ID
     * @return 结果
     */
    @Override
    public int deleteCameraByIds(String ids)
    {
        Long[] cameraIds = Convert.toLongArray(ids);
        for (Long cameraId : cameraIds)
        {
            cameraMapper.deleteCameraById(cameraId);
        }
        return cameraIds.length;
    }

    /**
     * 删除摄像头
     * 
     * @param id 摄像头 ID
     * @return 结果
     */
    @Override
    public int deleteCameraById(Long id)
    {
        return cameraMapper.deleteCameraById(id);
    }

    /**
     * 校验 IP 地址是否唯一
     * 
     * @param camera 摄像头
     * @return 结果
     */
    @Override
    public boolean checkIpUnique(Camera camera)
    {
        String ip = camera.getIp();
        Camera info = cameraMapper.checkIpUnique(ip);
        if (StringUtils.isNotNull(info))
        {
            if (!info.getIp().equals(ip)){
                return UserConstants.NOT_UNIQUE;
            }

        }
        return UserConstants.UNIQUE;
    }

    /**
     * 根据楼层查询摄像头列表
     * 
     * @param floor 楼层
     * @return 摄像头列表
     */
    @Override
    public List<Camera> selectCamerasByFloor(String floor)
    {
        return cameraMapper.selectCamerasByFloor(floor);
    }
    /**
     * 更新摄像头位置
     *
     * @param id 摄像头 ID
     * @param xAxis X 轴坐标
     * @param yAxis Y 轴坐标
     * @return 结果
     */
    @Override
    public int updatePosition(Long id, Double xAxis, Double yAxis)
    {
        Camera camera = new Camera();
        camera.setId(id);
        camera.setxAxis(xAxis);
        camera.setyAxis(yAxis);
        return cameraMapper.updateCamera(camera);
    }

    /**
     * 清除摄像头位置
     *
     * @param id 摄像头 ID
     * @return 结果
     */
    @Override
    public int clearPosition(Long id)
    {
        Camera camera = new Camera();
        camera.setId(id);
        camera.setxAxis(0.0);
        camera.setyAxis(0.0);
        return cameraMapper.updateCamera(camera);
    }

}
