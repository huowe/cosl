package com.ruoyi.web.controller.tool;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.utils.PlatformContext;
import com.ruoyi.system.service.ISysDictDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * 系统启动时初始化默认配置
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
@Component
public class SystemInitializer implements ApplicationRunner
{
    private static final Logger log = LoggerFactory.getLogger(SystemInitializer.class);

    @Resource
    private YuanJianApiClient yuanJianApiClient;

    @Autowired
    private ISysDictDataService dictDataService;

    /**
     * 系统启动时执行
     */
    @Override
    public void run(ApplicationArguments args) throws Exception
    {
        log.info("开始执行系统初始化任务...");
        
        try
        {
            // 初始化默认的 cameraGroupId
            initDefaultCameraGroupId();
            
            // 初始化默认的 repId
            initDefaultRepId();
            
            log.info("系统初始化任务完成");
        }
        catch (Exception e)
        {
            log.error("系统初始化任务失败", e);
        }
    }

    /**
     * 初始化默认的 cameraGroupId
     */
    private void initDefaultCameraGroupId()
    {
        String platformNo = PlatformContext.getPlatformNo();
        
        // 检查是否已存在
        SysDictData queryParam = new SysDictData();
        queryParam.setDictType("yuanjian_config");
        queryParam.setDictLabel("cameraGroupId");
        queryParam.setPlatformNo(platformNo);
        
        List<SysDictData> existingList = dictDataService.selectDictDataList(queryParam);
        
        if (existingList != null && !existingList.isEmpty())
        {
            log.info("cameraGroupId 已存在，跳过初始化");
            return;
        }
        
        try
        {
            // 调用API获取摄像机分组树
            String response = yuanJianApiClient.getCameraGroupTree();
            JSONObject jsonObject = JSONObject.parseObject(response);
            
            if ("SUCCESS".equals(jsonObject.getString("code")))
            {
                JSONArray treeArray = jsonObject.getJSONArray("data");
                
                if (treeArray != null && !treeArray.isEmpty())
                {
                    // 获取第一个分组的ID
                    JSONObject firstGroup = treeArray.getJSONObject(0);
                    String cameraGroupId = firstGroup.getString("groupId");
                    
                    if (cameraGroupId != null && !cameraGroupId.isEmpty())
                    {
                        // 保存到字典表
                        SysDictData dictData = new SysDictData();
                        dictData.setDictType("yuanjian_config");
                        dictData.setDictLabel("cameraGroupId");
                        dictData.setDictValue(cameraGroupId);
                        dictData.setPlatformNo(platformNo);
                        dictData.setDictSort(1L);
                        dictData.setStatus("0");
                        dictData.setIsDefault("Y");
                        dictData.setCreateBy("system");
                        
                        dictDataService.insertDictData(dictData);
                        
                        log.info("成功初始化默认 cameraGroupId: {}", cameraGroupId);
                    }
                    else
                    {
                        log.warn("获取到的 cameraGroupId 为空");
                    }
                }
                else
                {
                    log.warn("摄像机分组树为空，无法初始化 cameraGroupId");
                }
            }
            else
            {
                log.error("获取摄像机分组树失败: {}", jsonObject.getString("msg"));
            }
        }
        catch (Exception e)
        {
            log.error("初始化 cameraGroupId 失败", e);
        }
    }

    /**
     * 初始化默认的 repId
     */
    private void initDefaultRepId()
    {
        String platformNo = PlatformContext.getPlatformNo();
        
        // 检查是否已存在
        SysDictData queryParam = new SysDictData();
        queryParam.setDictType("yuanjian_config");
        queryParam.setDictLabel("repId");
        queryParam.setPlatformNo(platformNo);
        
        List<SysDictData> existingList = dictDataService.selectDictDataList(queryParam);
        
        if (existingList != null && !existingList.isEmpty())
        {
            log.info("repId 已存在，跳过初始化");
            return;
        }
        
        try
        {
            // 调用API获取底库树
            String response = yuanJianApiClient.getRepositoryTree();
            JSONObject jsonObject = JSONObject.parseObject(response);
            
            if ("SUCCESS".equals(jsonObject.getString("code")))
            {
                JSONArray treeArray = jsonObject.getJSONArray("data");
                
                if (treeArray != null && !treeArray.isEmpty())
                {
                    // 获取第一个底库的ID
                    JSONObject firstRepo = treeArray.getJSONObject(0);
                    String repId = firstRepo.getString("repositoryId");
                    
                    if (repId != null && !repId.isEmpty())
                    {
                        // 保存到字典表
                        SysDictData dictData = new SysDictData();
                        dictData.setDictType("yuanjian_config");
                        dictData.setDictLabel("repId");
                        dictData.setDictValue(repId);
                        dictData.setPlatformNo(platformNo);
                        dictData.setDictSort(2L);
                        dictData.setStatus("0");
                        dictData.setIsDefault("Y");
                        dictData.setCreateBy("system");
                        
                        dictDataService.insertDictData(dictData);
                        
                        log.info("成功初始化默认 repId: {}", repId);
                    }
                    else
                    {
                        log.warn("获取到的 repId 为空");
                    }
                }
                else
                {
                    log.warn("底库树为空，无法初始化 repId");
                }
            }
            else
            {
                log.error("获取底库树失败: {}", jsonObject.getString("msg"));
            }
        }
        catch (Exception e)
        {
            log.error("初始化 repId 失败", e);
        }
    }
}
