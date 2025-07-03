import os
from ultralytics.data.converter import convert_coco

# convert_coco(labels_dir="/mnt/beegfs/home/lcossio/datasets/cherry_CO/", use_segments=True)
# print("files in base folder: ",os.listdir("/mnt/beegfs/home/lcossio/datasets/cherry_CO/"))
convert_coco(labels_dir="/home/r2d2/2025/data_management/dataset_buds2/annotations", use_segments=True)
print("files in base folder: ",os.listdir("coco_converted/labels"))