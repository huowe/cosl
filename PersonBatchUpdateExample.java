package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.domain.entity.Person;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 批量更新人员房间信息 - 使用示例
 * 
 * @author ruoyi
 * @date 2026-04-02
 */
@RestController
@RequestMapping("/api/example")
public class PersonBatchUpdateExample
{
    /**
     * 示例 1: 批量分配房间给新上船人员
     * 
     * 场景：5 名新船员上船，需要分配房间和床位
     */
    @PostMapping("/example1")
    public AjaxResult example1_NewCrewAssignment()
    {
        List<Person> persons = new ArrayList<>();
        
        // 船员 1 - 分配到房间 A101 床位 A
        Person person1 = new Person();
        person1.setId(1L);  // 人员 ID
        person1.setRoomId(101L);  // 房间 ID
        person1.setBedId(201L);   // 床位 ID
        person1.setStatus("ONBOARD");  // 设置为在船状态
        persons.add(person1);
        
        // 船员 2 - 分配到同一房间 A101 床位 B
        Person person2 = new Person();
        person2.setId(2L);
        person2.setRoomId(101L);
        person2.setBedId(202L);
        person2.setStatus("ONBOARD");
        persons.add(person2);
        
        // 船员 3 - 分配到房间 A102 床位 A
        Person person3 = new Person();
        person3.setId(3L);
        person3.setRoomId(102L);
        person3.setBedId(203L);
        person3.setStatus("ONBOARD");
        persons.add(person3);
        
        // 船员 4 - 分配到房间 A102 床位 B
        Person person4 = new Person();
        person4.setId(4L);
        person4.setRoomId(102L);
        person4.setBedId(204L);
        person4.setStatus("ONBOARD");
        persons.add(person4);
        
        // 船员 5 - 分配到房间 A103 床位 A
        Person person5 = new Person();
        person5.setId(5L);
        person5.setRoomId(103L);
        person5.setBedId(205L);
        person5.setStatus("ONBOARD");
        persons.add(person5);
        
        // 调用批量更新接口
        // 注意：这里假设已经有 personService 注入
        // int result = personService.batchUpdateRoomInfo(persons);
        // return AjaxResult.success("成功更新" + result + "条记录");
        
        System.out.println("示例 1: 批量分配 5 名新船员房间");
        System.out.println("人员列表:" + persons);
        
        return AjaxResult.success("示例代码已打印到控制台，请查看输出");
    }
    
    /**
     * 示例 2: 批量调整房间
     * 
     * 场景：因房间维修，需要将 A101 房间的人员调整到 A201 房间
     */
    @PostMapping("/example2")
    public AjaxResult example2_RoomReassignment()
    {
        List<Person> persons = new ArrayList<>();
        
        // 将原来在 A101 房间的人员调整到 A201
        Person person1 = new Person();
        person1.setId(1L);
        person1.setRoomId(201L);  // 新房间 ID
        person1.setBedId(301L);   // 新床位 ID
        persons.add(person1);
        
        Person person2 = new Person();
        person2.setId(2L);
        person2.setRoomId(201L);
        person2.setBedId(302L);
        persons.add(person2);
        
        System.out.println("示例 2: 批量调整房间，从 A101 到 A201");
        System.out.println("人员列表:" + persons);
        
        return AjaxResult.success("示例代码已打印到控制台，请查看输出");
    }
    
    /**
     * 示例 3: 批量更新人员状态
     * 
     * 场景：一批人员转船，需要更新状态为 TRANSFER
     */
    @PostMapping("/example3")
    public AjaxResult example3_UpdateStatus()
    {
        List<Person> persons = new ArrayList<>();
        
        // 只更新状态，不改变房间和床位
        Person person1 = new Person();
        person1.setId(1L);
        person1.setStatus("TRANSFER");  // 转船状态
        persons.add(person1);
        
        Person person2 = new Person();
        person2.setId(2L);
        person2.setStatus("TRANSFER");
        persons.add(person2);
        
        Person person3 = new Person();
        person3.setId(3L);
        person3.setStatus("TRANSFER");
        persons.add(person3);
        
        System.out.println("示例 3: 批量更新 3 名人员状态为转船");
        System.out.println("人员列表:" + persons);
        
        return AjaxResult.success("示例代码已打印到控制台，请查看输出");
    }
    
    /**
     * 示例 4: 混合更新（房间 + 状态）
     * 
     * 场景：新分配房间同时设置状态
     */
    @PostMapping("/example4")
    public AjaxResult example4_MixedUpdate()
    {
        List<Person> persons = new ArrayList<>();
        
        // 人员 1 - 分配房间并设置为在船
        Person person1 = new Person();
        person1.setId(10L);
        person1.setRoomId(301L);
        person1.setBedId(401L);
        person1.setStatus("ONBOARD");
        persons.add(person1);
        
        // 人员 2 - 只分配房间，保持原状态
        Person person2 = new Person();
        person2.setId(11L);
        person2.setRoomId(301L);
        person2.setBedId(402L);
        // 不设置 status，保持原有状态
        persons.add(person2);
        
        // 人员 3 - 只更新状态，不分配房间
        Person person3 = new Person();
        person3.setId(12L);
        person3.setStatus("LEFT");  // 离船
        persons.add(person3);
        
        System.out.println("示例 4: 混合更新 - 不同人员更新不同字段");
        System.out.println("人员列表:" + persons);
        
        return AjaxResult.success("示例代码已打印到控制台，请查看输出");
    }
    
    /**
     * 示例 5: 实际业务中推荐的完整流程
     */
    @PostMapping("/example5")
    public AjaxResult example5_CompleteProcess()
    {
        try
        {
            // 步骤 1: 准备数据
            List<Person> persons = new ArrayList<>();
            
            // 从请求中获取人员分配数据（这里用硬编码示例）
            // 实际使用时可以从前端传来的 JSON 解析
            persons.add(createPerson(1L, 101L, 201L, "ONBOARD"));
            persons.add(createPerson(2L, 101L, 202L, "ONBOARD"));
            persons.add(createPerson(3L, 102L, 203L, "ONBOARD"));
            
            // 步骤 2: 数据验证
            if (persons == null || persons.isEmpty())
            {
                return AjaxResult.error("批量更新数据不能为空");
            }
            
            for (Person person : persons)
            {
                if (person.getId() == null)
                {
                    return AjaxResult.error("人员 ID 不能为空");
                }
            }
            
            // 步骤 3: 调用服务层批量更新
            // int result = personService.batchUpdateRoomInfo(persons);
            
            // 步骤 4: 返回结果
            // return AjaxResult.success("成功更新" + result + "条记录");
            
            System.out.println("示例 5: 完整的业务流程示例");
            System.out.println("待更新人员数：" + persons.size());
            System.out.println("人员详情：" + persons);
            
            return AjaxResult.success("示例代码执行成功，请查看控制台输出");
        }
        catch (Exception e)
        {
            return AjaxResult.error("批量更新失败：" + e.getMessage());
        }
    }
    
    /**
     * 辅助方法：创建人员对象
     */
    private Person createPerson(Long id, Long roomId, Long bedId, String status)
    {
        Person person = new Person();
        person.setId(id);
        person.setRoomId(roomId);
        person.setBedId(bedId);
        person.setStatus(status);
        return person;
    }
    
    /**
     * 示例 6: 从前端接收 JSON 数据并处理
     * 
     * 这是实际应该使用的控制器方法示例
     */
    @PostMapping("/batchUpdateDemo")
    public AjaxResult batchUpdateDemo(@RequestBody List<Person> persons)
    {
        try
        {
            // 打印接收到的数据
            System.out.println("接收到批量更新请求，人员数量：" + persons.size());
            for (int i = 0; i < persons.size(); i++)
            {
                Person p = persons.get(i);
                System.out.printf("人员%d: ID=%d, 房间 ID=%d, 床位 ID=%d, 状态=%s%n",
                    i + 1, 
                    p.getId(), 
                    p.getRoomId() != null ? p.getRoomId() : -1,
                    p.getBedId() != null ? p.getBedId() : -1,
                    p.getStatus() != null ? p.getStatus() : "未设置"
                );
            }
            
            // 验证数据
            if (persons == null || persons.isEmpty())
            {
                return AjaxResult.error("批量更新数据不能为空");
            }
            
            for (Person person : persons)
            {
                if (person.getId() == null)
                {
                    return AjaxResult.error("人员 ID 不能为空: " + person.getName());
                }
            }
            
            // 调用服务层更新
            // int result = personService.batchUpdateRoomInfo(persons);
            
            // 模拟返回
            return AjaxResult.success("示例模式：成功更新 " + persons.size() + " 条记录");
        }
        catch (Exception e)
        {
            return AjaxResult.error("批量更新失败：" + e.getMessage());
        }
    }
}
