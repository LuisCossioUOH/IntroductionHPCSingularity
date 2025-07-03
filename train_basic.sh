#!/bin/bash

#SBATCH --job-name=train_basic1
#SBATCH --error=.logs/err_train1.err
#SBATCH --output=.logs/out_train1.out
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --time=02:00:0
#SBATCH --mem-per-cpu=15G
#SBATCH --nodelist=v100
#SBATCH --gres=gpu:1
#SBATCH --gpus-per-task=1
#SBATCH --mail-type=END
#SBATCH --mail-user=luis.cossio@uoh.cl


cd ../sifs
singularity instance start --nv ultra.sif ultra1
cd ../ultra
singularity exec  --nv instance://ultra1 python train_ultralytics.py --dataset-config config/buds.yaml --epochs 150 --imgsz 1728 --batch 12
singularity instance stop ultra1

