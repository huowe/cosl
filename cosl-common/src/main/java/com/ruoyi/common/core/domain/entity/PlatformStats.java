package com.ruoyi.common.core.domain.entity;

import java.io.Serializable;

/**
 * 平台数据统计信息对象
 * 
 * @author ruoyi
 * @date 2026-04-04
 */
public class PlatformStats implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 人员统计 */
    private PersonStats personStats;

    /** 房间统计 */
    private RoomStats roomStats;

    /** 救生艇统计 */
    private LifeboatStats lifeboatStats;

    /** 摄像头统计 */
    private CameraStats cameraStats;

    /** 演习统计 */
    private DrillStats drillStats;

    public PersonStats getPersonStats()
    {
        return personStats;
    }

    public void setPersonStats(PersonStats personStats)
    {
        this.personStats = personStats;
    }

    public RoomStats getRoomStats()
    {
        return roomStats;
    }

    public void setRoomStats(RoomStats roomStats)
    {
        this.roomStats = roomStats;
    }

    public LifeboatStats getLifeboatStats()
    {
        return lifeboatStats;
    }

    public void setLifeboatStats(LifeboatStats lifeboatStats)
    {
        this.lifeboatStats = lifeboatStats;
    }

    public CameraStats getCameraStats()
    {
        return cameraStats;
    }

    public void setCameraStats(CameraStats cameraStats)
    {
        this.cameraStats = cameraStats;
    }

    public DrillStats getDrillStats()
    {
        return drillStats;
    }

    public void setDrillStats(DrillStats drillStats)
    {
        this.drillStats = drillStats;
    }

    @Override
    public String toString()
    {
        return "PlatformStats{" +
                "personStats=" + personStats +
                ", roomStats=" + roomStats +
                ", lifeboatStats=" + lifeboatStats +
                ", cameraStats=" + cameraStats +
                ", drillStats=" + drillStats +
                '}';
    }

    /**
     * 人员统计信息
     */
    public static class PersonStats implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 总人数 */
        private Integer total;

        /** 当前在船人数 */
        private Integer current;

        /** 进入人数 */
        private Integer enter;

        /** 离开人数 */
        private Integer leave;

        public Integer getTotal()
        {
            return total;
        }

        public void setTotal(Integer total)
        {
            this.total = total;
        }

        public Integer getCurrent()
        {
            return current;
        }

        public void setCurrent(Integer current)
        {
            this.current = current;
        }

        public Integer getEnter()
        {
            return enter;
        }

        public void setEnter(Integer enter)
        {
            this.enter = enter;
        }

        public Integer getLeave()
        {
            return leave;
        }

        public void setLeave(Integer leave)
        {
            this.leave = leave;
        }

        @Override
        public String toString()
        {
            return "PersonStats{" +
                    "total=" + total +
                    ", current=" + current +
                    ", enter=" + enter +
                    ", leave=" + leave +
                    '}';
        }
    }

    /**
     * 房间统计信息
     */
    public static class RoomStats implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 房间总数 */
        private Integer total;

        /** 空闲房间数 */
        private Integer free;

        public Integer getTotal()
        {
            return total;
        }

        public void setTotal(Integer total)
        {
            this.total = total;
        }

        public Integer getFree()
        {
            return free;
        }

        public void setFree(Integer free)
        {
            this.free = free;
        }

        @Override
        public String toString()
        {
            return "RoomStats{" +
                    "total=" + total +
                    ", free=" + free +
                    '}';
        }
    }

    /**
     * 救生艇统计信息
     */
    public static class LifeboatStats implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 救生艇总数 */
        private Integer total;

        /** 空闲救生艇数 */
        private Integer free;

        public Integer getTotal()
        {
            return total;
        }

        public void setTotal(Integer total)
        {
            this.total = total;
        }

        public Integer getFree()
        {
            return free;
        }

        public void setFree(Integer free)
        {
            this.free = free;
        }

        @Override
        public String toString()
        {
            return "LifeboatStats{" +
                    "total=" + total +
                    ", free=" + free +
                    '}';
        }
    }

    /**
     * 摄像头统计信息
     */
    public static class CameraStats implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 摄像头总数 */
        private Integer total;

        /** 开启摄像头数 */
        private Integer online;

        public Integer getTotal()
        {
            return total;
        }

        public void setTotal(Integer total)
        {
            this.total = total;
        }

        public Integer getOnline()
        {
            return online;
        }

        public void setOnline(Integer online)
        {
            this.online = online;
        }

        @Override
        public String toString()
        {
            return "CameraStats{" +
                    "total=" + total +
                    ", online=" + online +
                    '}';
        }
    }

    /**
     * 演习统计信息
     */
    public static class DrillStats implements Serializable
    {
        private static final long serialVersionUID = 1L;

        /** 本月演习次数 */
        private Integer thisMonth;

        /** 累计演习次数 */
        private Integer total;

        public Integer getThisMonth()
        {
            return thisMonth;
        }

        public void setThisMonth(Integer thisMonth)
        {
            this.thisMonth = thisMonth;
        }

        public Integer getTotal()
        {
            return total;
        }

        public void setTotal(Integer total)
        {
            this.total = total;
        }

        @Override
        public String toString()
        {
            return "DrillStats{" +
                    "thisMonth=" + thisMonth +
                    ", total=" + total +
                    '}';
        }
    }
}
