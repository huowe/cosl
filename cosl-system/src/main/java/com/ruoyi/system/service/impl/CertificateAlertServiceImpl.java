package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.CertificateAlert;
import com.ruoyi.common.core.domain.entity.Person;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.mapper.PersonMapper;
import com.ruoyi.system.service.ICertificateAlertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 证书到期提醒 Service 业务层处理
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
@Service
public class CertificateAlertServiceImpl implements ICertificateAlertService
{
    @Autowired
    private PersonMapper personMapper;

    /**
     * 获取证书到期提醒列表
     * 
     * @return 提醒列表
     */
    @Override
    public List<CertificateAlert> getCertificateAlerts()
    {
        List<CertificateAlert> alerts = new ArrayList<>();
        
        // 获取即将到期的证书提醒
        CertificateAlert expiringSoonAlert = getExpiringSoonAlert();
        if (expiringSoonAlert != null && expiringSoonAlert.getCount() > 0)
        {
            alerts.add(expiringSoonAlert);
        }
        
        // 获取已过期的证书提醒
        CertificateAlert expiredAlert = getExpiredAlert();
        if (expiredAlert != null && expiredAlert.getCount() > 0)
        {
            alerts.add(expiredAlert);
        }
        
        return alerts;
    }

    /**
     * 获取即将到期的证书提醒
     * 
     * @return 提醒信息
     */
    @Override
    public CertificateAlert getExpiringSoonAlert()
    {
        List<Person> persons = personMapper.selectExpiringSoonPersons();
        int count = personMapper.countExpiringSoonPersons();
        
        if (count == 0)
        {
            return null;
        }
        
        CertificateAlert alert = new CertificateAlert();
        alert.setType("EXPIRING_SOON");
        alert.setTitle("证件即将到期");
        alert.setContent(count + "人证件将在30天内到期");
        alert.setDescription("持续提醒");
        alert.setCount(count);
        alert.setAlertTime(new Date());
        
        // 转换人员信息
        List<CertificateAlert.CertificatePerson> certPersons = new ArrayList<>();
        for (Person person : persons)
        {
            CertificateAlert.CertificatePerson certPerson = new CertificateAlert.CertificatePerson();
            certPerson.setPersonId(person.getId());
            certPerson.setName(person.getName());
            certPerson.setCertificateExpireDate(person.getCertificateExpireDate());
            certPerson.setPosition(person.getPosition());
            certPerson.setCompany(person.getCompany());
            
            // 计算到期天数（负数表示还未到期）
            if (person.getCertificateExpireDate() != null)
            {
                int days = DateUtils.differentDaysByMillisecond(new Date(), person.getCertificateExpireDate());
                certPerson.setExpiredDays(days);
            }
            
            certPersons.add(certPerson);
        }
        alert.setPersons(certPersons);
        
        return alert;
    }

    /**
     * 获取已过期的证书提醒
     * 
     * @return 提醒信息
     */
    @Override
    public CertificateAlert getExpiredAlert() {
        List<Person> persons = personMapper.selectExpiredPersons();
        int count = personMapper.countExpiredPersons();

        if (count == 0) {
            return null;
        }

        CertificateAlert alert = new CertificateAlert();
        alert.setType("EXPIRED");
        alert.setTitle("证件已过期");
        alert.setCount(count);
        alert.setAlertTime(new Date());
        List<CertificateAlert.CertificatePerson> certPersons = new ArrayList<>();
        for (Person person : persons) {

            CertificateAlert.CertificatePerson certPerson = new CertificateAlert.CertificatePerson();
            certPerson.setPersonId(person.getId());
            certPerson.setName(person.getName());
            certPerson.setCertificateExpireDate(person.getCertificateExpireDate());
            certPerson.setPosition(person.getPosition());
            certPerson.setCompany(person.getCompany());

            // 计算过期天数（正数表示已过期天数）
            if (person.getCertificateExpireDate() != null) {
                int days = DateUtils.differentDaysByMillisecond(person.getCertificateExpireDate(), new Date());
                certPerson.setExpiredDays(days);

                // 设置内容：张三的安全证书已过期3天
                alert.setContent(person.getName() + "的安全证书已过期" + days + "天");
            }


            certPersons.add(certPerson);
            alert.setPersons(certPersons);
        }

        return alert;
    }

    /**
     * 获取证书提醒总数
     * 
     * @return 提醒总数
     */
    @Override
    public Integer getAlertTotal()
    {
        int expiringSoonCount = personMapper.countExpiringSoonPersons();
        int expiredCount = personMapper.countExpiredPersons();
        return expiringSoonCount + expiredCount;
    }
}
