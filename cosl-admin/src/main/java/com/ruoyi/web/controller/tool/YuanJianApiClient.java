package com.ruoyi.web.controller.tool;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.entity.Camera;
import com.ruoyi.common.core.domain.entity.CameraGroup;
import com.ruoyi.common.core.domain.entity.YuanJianCamera;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class YuanJianApiClient {
    @Value("${yuanjian.base.url}")
    private  String BASE_URL;

    @Resource
    private HttpClientUtil httpClientUtil;

    /**
     * 新增摄像机分组
     */
    public String addCameraGroup(CameraGroup cameraGroup) {

        String url = BASE_URL + "/cameraGroup/add";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(cameraGroup));

        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 新增摄像头
     * @param camera 摄像头对象
     * @return 响应结果
     */
    public String addCamera(Camera camera) {
        String url = BASE_URL + "/camera/add";
        YuanJianCamera yuanJianCamera = new YuanJianCamera();
        yuanJianCamera.setCameraGroupId(camera.getCameraGroupId());
        yuanJianCamera.setCameraName(camera.getName());
        yuanJianCamera.setIp(camera.getIp());
        yuanJianCamera.setLatitude(camera.getLatitude());
        yuanJianCamera.setLongitude(camera.getLongitude());
        yuanJianCamera.setStreamURL(camera.getStreamURL());
        yuanJianCamera.setUserName(camera.getUserName());
        yuanJianCamera.setUserPwd(camera.getUserPwd());
        yuanJianCamera.setCameraId(camera.getCameraId());
        yuanJianCamera.setCameraType(camera.getCameraType());
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(yuanJianCamera));
        
        return httpClientUtil.postJson(url, jsonObject);
    }


    public String getCameraGroupTree() {
        String url = BASE_URL + "/cameraGroup/tree";
        return httpClientUtil.get(url);
    }

}