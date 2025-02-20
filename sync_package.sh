#!/bin/bash
# 功能：比较两文件夹中的内容，并将相同的子文件夹从Source_Folder复制到Destination_Folder
# 用法：sh ./sync_package.sh ./Destination_Folder ./Source_Folder

# 检查是否提供了两个参数
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/FolderA /path/to/FolderB"
    exit 1
fi

# 获取FolderA和FolderB的路径
FOLDER_A="$1"
FOLDER_B="$2"

# 检查路径是否存在
if [ ! -d "$FOLDER_A" ]; then
    echo "Error: FolderA does not exist at $FOLDER_A"
    exit 1
fi

if [ ! -d "$FOLDER_B" ]; then
    echo "Error: FolderB does not exist at $FOLDER_B"
    exit 1
fi

# 获取FolderA和FolderB中的子文件夹名称
FOLDER_A_SUBDIRS=$(ls -d "$FOLDER_A"/*/ 2>/dev/null | xargs -I {} basename {})
FOLDER_B_SUBDIRS=$(ls -d "$FOLDER_B"/*/ 2>/dev/null | xargs -I {} basename {})

# 比较子文件夹名称
for subdir in $FOLDER_B_SUBDIRS; do
    if echo "$FOLDER_A_SUBDIRS" | grep -q -w "$subdir"; then
        # 如果FolderA中有相同名称的子文件夹，则移除
        echo "Removing $FOLDER_A/$subdir"
        rm -rf "$FOLDER_A/$subdir"
        
        # 将FolderB中的子文件夹复制到FolderA
        echo "Copying $FOLDER_B/$subdir to $FOLDER_A/"
        cp -r "$FOLDER_B/$subdir" "$FOLDER_A/"
    fi
done

echo "Operation completed."
