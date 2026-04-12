#!/bin/bash
# 批量修改剩余Mapper XML添加平台过滤的辅助脚本
# 使用方法: 在Linux/Mac环境下运行此脚本

echo "开始批量修改Mapper XML..."

# 需要修改的文件列表
FILES=(
    "cosl-system/src/main/resources/mapper/system/LifeboatSeatMapper.xml"
    "cosl-system/src/main/resources/mapper/system/LifeboatPersonMapper.xml"
    "cosl-system/src/main/resources/mapper/system/EvacuationPointMapper.xml"
    "cosl-system/src/main/resources/mapper/system/DrillMapper.xml"
    "cosl-system/src/main/resources/mapper/system/DrillPersonMapper.xml"
    "cosl-system/src/main/resources/mapper/system/EvacuationMapper.xml"
    "cosl-system/src/main/resources/mapper/system/PersonTrackMapper.xml"
    "cosl-system/src/main/resources/mapper/system/PersonFaceMapper.xml"
    "cosl-system/src/main/resources/mapper/system/PersonGaitMapper.xml"
)

# 备份文件
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        cp "$file" "${file}.bak"
        echo "已备份: $file"
    else
        echo "文件不存在: $file"
    fi
done

echo ""
echo "备份完成!请手动按照以下步骤修改每个文件:"
echo ""
echo "1. 在<resultMap>中添加: <result property=\"platformNo\" column=\"platform_no\" />"
echo "2. 在selectVo SQL中添加: platform_no 字段"
echo "3. 在查询where条件中添加平台过滤"
echo "4. 在insert中添加platform_no处理"
echo "5. 在update中添加platform_no更新"
echo "6. 统计查询也添加平台过滤"
echo ""
echo "参考已完成修改的文件:"
echo "- PersonMapper.xml"
echo "- RoomConfigMapper.xml"
echo "- CameraMapper.xml"
echo "- LifeboatConfigMapper.xml"
