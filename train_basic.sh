#!/bin/bash

#SBATCH --job-name=train_basic
#SBATCH --error=.logs/res_train.err
#SBATCH --output=.logs/out_train.out
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --time=02:30:0
#SBATCH --mem-per-cpu=25G
#SBATCH --nodelist=v100
#SBATCH --gres=gpu:1
#SBATCH --gpus-per-task=1
#SBATCH --mail-type=END
#SBATCH --mail-user=luis.cossio@uoh.cl

cd ../sifs
singularity instance start --nv ultra.sif ultra1
cd ../ultra
singularity exec  --nv instance://ultra1 python train_ultralytics.py --dataset-config conf>
singularity instance stop ultra1
