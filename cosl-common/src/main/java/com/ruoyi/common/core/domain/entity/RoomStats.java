package com.ruoyi.common.core.domain.entity;

import java.io.Serializable;

/**
 * 房间统计信息对象
 * 
 * @author ruoyi
 */
public class RoomStats implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 房间总数 */
    private Integer totalRooms;

    /** 空闲房间数 */
    private Integer freeRooms;

    /** 锁定房间数 */
    private Integer lockedRooms;

    /** 占用房间数 */
    private Integer occupiedRooms;

    /** 床位总数 */
    private Integer totalBeds;

    /** 空闲床位数 */
    private Integer freeBeds;

    /** 锁定床位数 */
    private Integer lockedBeds;

    /** 占用床位数 */
    private Integer occupiedBeds;

    public Integer getTotalRooms()
    {
        return totalRooms;
    }

    public void setTotalRooms(Integer totalRooms)
    {
        this.totalRooms = totalRooms;
    }

    public Integer getFreeRooms()
    {
        return freeRooms;
    }

    public void setFreeRooms(Integer freeRooms)
    {
        this.freeRooms = freeRooms;
    }

    public Integer getLockedRooms()
    {
        return lockedRooms;
    }

    public void setLockedRooms(Integer lockedRooms)
    {
        this.lockedRooms = lockedRooms;
    }

    public Integer getOccupiedRooms()
    {
        return occupiedRooms;
    }

    public void setOccupiedRooms(Integer occupiedRooms)
    {
        this.occupiedRooms = occupiedRooms;
    }

    public Integer getTotalBeds()
    {
        return totalBeds;
    }

    public void setTotalBeds(Integer totalBeds)
    {
        this.totalBeds = totalBeds;
    }

    public Integer getFreeBeds()
    {
        return freeBeds;
    }

    public void setFreeBeds(Integer freeBeds)
    {
        this.freeBeds = freeBeds;
    }

    public Integer getLockedBeds()
    {
        return lockedBeds;
    }

    public void setLockedBeds(Integer lockedBeds)
    {
        this.lockedBeds = lockedBeds;
    }

    public Integer getOccupiedBeds()
    {
        return occupiedBeds;
    }

    public void setOccupiedBeds(Integer occupiedBeds)
    {
        this.occupiedBeds = occupiedBeds;
    }

    @Override
    public String toString() {
        return "RoomStats{" +
                "totalRooms=" + totalRooms +
                ", freeRooms=" + freeRooms +
                ", lockedRooms=" + lockedRooms +
                ", occupiedRooms=" + occupiedRooms +
                ", totalBeds=" + totalBeds +
                ", freeBeds=" + freeBeds +
                ", lockedBeds=" + lockedBeds +
                ", occupiedBeds=" + occupiedBeds +
                '}';
    }
}
