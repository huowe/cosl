package com.ruoyi.web.controller.tool;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.entity.Camera;
import com.ruoyi.common.core.domain.entity.CameraGroup;
import com.ruoyi.common.core.domain.entity.CameraSetupRequest;
import com.ruoyi.common.core.domain.entity.ImageAnalysisRequest;
import com.ruoyi.common.core.domain.entity.MonitorBindFeatureRequest;
import com.ruoyi.common.core.domain.entity.MonitorCreateRequest;
import com.ruoyi.common.core.domain.entity.MonitorQueryRequest;
import com.ruoyi.common.core.domain.entity.SnapComparisonRequest;
import com.ruoyi.common.core.domain.entity.SnapFeaturePageRequest;
import com.ruoyi.common.core.domain.entity.YuanJianCamera;
import com.ruoyi.common.core.domain.entity.YuanJianRepository;
import com.ruoyi.system.domain.CameraQueryRequest;
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
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(yuanJianCamera));
        
        return httpClientUtil.postJson(url, jsonObject);
    }
    /**
     * 新增摄像头
     * @param camera 摄像头对象
     * @return 响应结果
     */
    public String editCamera(Camera camera) {
        String url = BASE_URL + "/camera/edit";
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
        yuanJianCamera.setCameraId(camera.getCameraId());
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(yuanJianCamera));

        return httpClientUtil.postJson(url, jsonObject);
    }

    public String getCameraGroupTree() {
        String url = BASE_URL + "/cameraGroup/tree";
        return httpClientUtil.get(url);
    }

    public String getRepositoryTree() {
        String url = BASE_URL + "/repository/tree";
        return httpClientUtil.get(url);
    }

    /**
     * 创建人员底库
     * @param repository 底库对象
     * @return 响应结果
     */
    public String repositoryAdd(YuanJianRepository repository) {
        String url = BASE_URL + "/repository/add";
        repository.setRepParentId("1000000000000000000");
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(repository));
        return httpClientUtil.postJson(url, jsonObject);
    }

    public String getCameraPage(CameraQueryRequest cameraQueryRequest) {
        cameraQueryRequest.setPageNo(1);
        cameraQueryRequest.setPageSize(100);
        String url = BASE_URL + "/camera/page";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(cameraQueryRequest));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 摄像机启停抓拍
     * @param request 启停请求对象
     * @return 响应结果
     */
    public String cameraSetup(CameraSetupRequest request) {
        String url = BASE_URL + "/camera/setup";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 创建底库人员
     * @param request 创建请求对象
     * @return 响应结果
     */
    public String monitorCreate(MonitorCreateRequest request) {
        String url = BASE_URL + "/monitor/create";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 上传图片同步解析返回特征
     * @param request 图片分析请求对象
     * @return 响应结果
     */
    public String imageAnalysis(ImageAnalysisRequest request) {
        String url = BASE_URL + "/image/analysis";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 上传图片同步解析返回特征（使用Base64）
     * @param imageBase64 图片Base64字符串
     * @return 响应结果
     */
    public String imageAnalysisByBase64(String imageBase64) {
        ImageAnalysisRequest request = new ImageAnalysisRequest();
        request.setImageBase64(imageBase64);
        return imageAnalysis(request);
    }

    /**
     * 上传图片同步解析返回特征（使用URL）
     * @param imageUrl 图片URL地址
     * @return 响应结果
     */
    public String imageAnalysisByUrl(String imageUrl) {
        ImageAnalysisRequest request = new ImageAnalysisRequest();
        request.setUrl(imageUrl);
        return imageAnalysis(request);
    }

    /**
     * 绑定底库人员特征
     * @param request 绑定请求对象
     * @return 响应结果
     */
    public String monitorBindFeature(MonitorBindFeatureRequest request) {
        String url = BASE_URL + "/monitor/bindFeature?force=true&unbindOther=true";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 绑定底库人员特征（简化方法）
     * @param monitorId 底库人员id
     * @param featureIds 特征id列表
     * @return 响应结果
     */
    public String monitorBindFeature(String monitorId, java.util.List<String> featureIds) {
        MonitorBindFeatureRequest request = new MonitorBindFeatureRequest();
        request.setMonitorId(monitorId);
        request.setFeatureIds(featureIds);
        // gaitIDs 为过期字段，如果需要可以设置
        // request.setGaitIDs(featureIds);
        return monitorBindFeature(request);
    }

    /**
     * 绑定底库人员特征（带查询参数）
     * @param monitorId 底库人员id
     * @param featureIds 特征id列表
     * @param force 是否强制绑定
     * @param unbindOther 是否自动解绑其他特征
     * @return 响应结果
     */
    public String monitorBindFeatureWithParams(String monitorId, java.util.List<String> featureIds, 
                                                String force, String unbindOther) {
        // 构建 URL 带查询参数
        StringBuilder urlBuilder = new StringBuilder(BASE_URL);
        urlBuilder.append("/monitor/bindFeature?");
        
        if (force != null && !force.isEmpty()) {
            urlBuilder.append("force=").append(force).append("&");
        }
        if (unbindOther != null && !unbindOther.isEmpty()) {
            urlBuilder.append("unbindOther=").append(unbindOther).append("&");
        }
        
        // 移除最后一个 &
        String url = urlBuilder.toString();
        if (url.endsWith("&")) {
            url = url.substring(0, url.length() - 1);
        }
        
        // 构建请求体
        MonitorBindFeatureRequest request = new MonitorBindFeatureRequest();
        request.setMonitorId(monitorId);
        request.setFeatureIds(featureIds);
        
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 解绑底库人员特征
     * @param request 解绑请求对象
     * @return 响应结果
     */
    public String monitorUnbindFeature(MonitorBindFeatureRequest request) {
        String url = BASE_URL + "/monitor/unbindFeature";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 解绑底库人员特征（简化方法）
     * @param monitorId 底库人员id
     * @param featureIds 特征id列表
     * @return 响应结果
     */
    public String monitorUnbindFeature(String monitorId, java.util.List<String> featureIds) {
        MonitorBindFeatureRequest request = new MonitorBindFeatureRequest();
        request.setMonitorId(monitorId);
        request.setFeatureIds(featureIds);
        // gaitIDs 为过期字段，如果需要可以设置
        // request.setGaitIDs(featureIds);
        return monitorUnbindFeature(request);
    }

    /**
     * 解绑底库人员所有特征
     * @param monitorId 底库人员id
     * @return 响应结果
     */
    public String monitorUnbindAllFeatures(String monitorId) {
        MonitorBindFeatureRequest request = new MonitorBindFeatureRequest();
        request.setMonitorId(monitorId);
        request.setFeatureIds(new java.util.ArrayList<>()); // 空列表表示解绑所有
        return monitorUnbindFeature(request);
    }

    /**
     * 获取底库人员特征
     * @param monitorId 底库人员id
     * @return 响应结果
     */
    public String getMonitorFeature(String monitorId) {
        StringBuilder urlBuilder = new StringBuilder(BASE_URL);
        urlBuilder.append("/monitor/getMonitorFeature?monitorId=").append(monitorId);
        return httpClientUtil.get(urlBuilder.toString());
    }

    /**
     * 获取底库人员特征详情
     * @param featureId 特征id
     * @return 响应结果
     */
    public String getMonitorFeatureDetail(String featureId) {
        StringBuilder urlBuilder = new StringBuilder(BASE_URL);
        urlBuilder.append("/feature/monitorFeatureDetail?featureId=").append(featureId);
        return httpClientUtil.get(urlBuilder.toString());
    }

    /**
     * 抓拍特征分页查询
     * @param request 查询请求对象
     * @return 响应结果
     */
    public String snapFeaturePage(SnapFeaturePageRequest request) {
        String url = BASE_URL + "/feature/snapPage";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 抓拍特征分页查询（简化方法）
     * @param pageNo 页码
     * @param pageSize 每页数量
     * @return 响应结果
     */
    public String snapFeaturePage(Integer pageNo, Integer pageSize) {
        SnapFeaturePageRequest request = new SnapFeaturePageRequest();
        request.setPageNo(pageNo);
        request.setPageSize(pageSize);
        return snapFeaturePage(request);
    }

    /**
     * 抓拍特征分页查询（带时间范围）
     * @param pageNo 页码
     * @param pageSize 每页数量
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 响应结果
     */
    public String snapFeaturePageByTime(Integer pageNo, Integer pageSize, String startTime, String endTime) {
        SnapFeaturePageRequest request = new SnapFeaturePageRequest();
        request.setPageNo(pageNo);
        request.setPageSize(pageSize);
        request.setStartTime(startTime);
        request.setEndTime(endTime);
        return snapFeaturePage(request);
    }

    /**
     * 抓拍特征分页查询（按设备）
     * @param pageNo 页码
     * @param pageSize 每页数量
     * @param deviceIds 设备ID列表
     * @return 响应结果
     */
    public String snapFeaturePageByDevice(Integer pageNo, Integer pageSize, java.util.List<String> deviceIds) {
        SnapFeaturePageRequest request = new SnapFeaturePageRequest();
        request.setPageNo(pageNo);
        request.setPageSize(pageSize);
        request.setDeviceIds(deviceIds);
        return snapFeaturePage(request);
    }

    /**
     * 抓拍特征分页查询（按摄像机）
     * @param pageNo 页码
     * @param pageSize 每页数量
     * @param cameraIds 摄像机ID列表
     * @return 响应结果
     */
    public String snapFeaturePageByCamera(Integer pageNo, Integer pageSize, java.util.List<String> cameraIds) {
        SnapFeaturePageRequest request = new SnapFeaturePageRequest();
        request.setPageNo(pageNo);
        request.setPageSize(pageSize);
        request.setCameraIds(cameraIds);
        return snapFeaturePage(request);
    }

    /**
     * 和抓拍比对
     * @param request 比对请求对象
     * @return 响应结果
     */
    public String snapComparison(SnapComparisonRequest request) {
        String url = BASE_URL + "/comparison/snap";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 和抓拍比对（简化方法 - 底库人员比对）
     * @param featureIds 特征ID列表
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 响应结果
     */
    public String snapComparisonForMonitor(java.util.List<String> featureIds, String startTime, String endTime) {
        SnapComparisonRequest request = new SnapComparisonRequest();
        request.setFeatureIds(featureIds);
        request.setStartTime(startTime);
        request.setEndTime(endTime);
        request.setIsMonitor(true); // 检索目标是底库人员
        request.setSourceType(10); // 所有摄像机
        request.setPage(1);
        request.setSize(20);
        request.setTopN(10);
        // 设置默认阈值
        request.setFaceThd(0.5);
        request.setReidThd(0.5);
        request.setGaitThd(0.5);
        return snapComparison(request);
    }

    /**
     * 和抓拍比对（简化方法 - 非底库人员比对）
     * @param featureIds 特征ID列表
     * @param sourceIds 摄像机ID列表
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 响应结果
     */
    public String snapComparisonForStranger(java.util.List<String> featureIds, java.util.List<String> sourceIds, 
                                             String startTime, String endTime) {
        SnapComparisonRequest request = new SnapComparisonRequest();
        request.setFeatureIds(featureIds);
        request.setSourceIds(sourceIds);
        request.setStartTime(startTime);
        request.setEndTime(endTime);
        request.setIsMonitor(false); // 检索目标不是底库人员
        request.setSourceType(0); // 摄像机
        request.setPage(1);
        request.setSize(20);
        request.setTopN(10);
        // 设置默认阈值
        request.setFaceThd(0.5);
        request.setReidThd(0.5);
        request.setGaitThd(0.5);
        return snapComparison(request);
    }

    /**
     * 获取底库人员信息
     * @param monitorId 底库人员id
     * @return 响应结果
     */
    public String getMonitorInfo(String monitorId) {
        StringBuilder urlBuilder = new StringBuilder(BASE_URL);
        urlBuilder.append("/monitor/getInfo?monitorId=").append(monitorId);
        return httpClientUtil.get(urlBuilder.toString());
    }

    /**
     * 查询底库的底库人员
     * @param request 查询请求对象
     * @return 响应结果
     */
    public String queryMonitors(MonitorQueryRequest request) {
        String url = BASE_URL + "/monitor/query";
        JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(request));
        return httpClientUtil.postJson(url, jsonObject);
    }

    /**
     * 查询底库人员（简化方法）
     * @param repIds 底库ID列表
     * @param page 页码
     * @param size 每页数量
     * @return 响应结果
     */
    public String queryMonitors(java.util.List<String> repIds, Integer page, Integer size) {
        MonitorQueryRequest request = new MonitorQueryRequest();
        request.setRepIds(repIds);
        request.setPage(page);
        request.setSize(size);
        return queryMonitors(request);
    }

    /**
     * 查询底库人员（带搜索条件）
     * @param repIds 底库ID列表
     * @param page 页码
     * @param size 每页数量
     * @param query 搜索条件（姓名/身份证）
     * @return 响应结果
     */
    public String queryMonitorsWithSearch(java.util.List<String> repIds, Integer page, Integer size, String query) {
        MonitorQueryRequest request = new MonitorQueryRequest();
        request.setRepIds(repIds);
        request.setPage(page);
        request.setSize(size);
        request.setQuery(query);
        return queryMonitors(request);
    }




}