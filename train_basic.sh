#!/bin/bash

SBATCH --job-name=train_basic_ultra
SBATCH --error=/mnt/beegfs/home/lcossio/scripts/.logs/res.err
SBATCH --output=/mnt/beegfs/home/lcossio/scripts/.logs/res.out
SBATCH --cpus-per-task=1
SBATCH --ntask=1
SBATCH --time=6:30:0
SBATCH --mem-per-cpu=9G
SBATCH --nodelist=v100
SBATCH --gres=gpu:1
SBATCH --gpus-per-task=1
SBATCH --mailtype=ALL
SBATCH --mail-list=luis.cossio@uoh.cl

cd ../sifs
singularity instance start ultra.sif ultra1
cd ../ultra
singularity exec instance://ultra1 python train_cherry_co.py --epochs 50
singularity instance stop ultra1
