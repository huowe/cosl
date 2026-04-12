package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.CertificateAlert;

import java.util.List;

/**
 * 证书到期提醒 Service 接口
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
public interface ICertificateAlertService
{
    /**
     * 获取证书到期提醒列表
     * 
     * @return 提醒列表
     */
    public List<CertificateAlert> getCertificateAlerts();

    /**
     * 获取即将到期的证书提醒
     * 
     * @return 提醒信息
     */
    public CertificateAlert getExpiringSoonAlert();

    /**
     * 获取已过期的证书提醒
     * 
     * @return 提醒信息
     */
    public CertificateAlert getExpiredAlert();

    /**
     * 获取证书提醒总数
     * 
     * @return 提醒总数
     */
    public Integer getAlertTotal();
}
