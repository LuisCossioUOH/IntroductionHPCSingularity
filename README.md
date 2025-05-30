# IntroductionHPCSingularity

# Singularity setup
## Pull containers
To pull containers from a library
```commandline
singularity pull ultra.sif docker://ultralytics/ultralytics
```

## Build image
Images are represented by singularity image files (.sif). This object are usefull for running commands:

```commandline
singularity build ultra.sif docker://ultralytics/ultralytics
```

## Bind a sandbox image
Sandbox images are allow to be modified, unlike .sif files. 

```commandline
singularity build --sandbox ultra_sand docker://ultralytics/ultralytics
```

## Open shell container and bind to volume
To initiate a container from an image and generate a shell, use the singularity shell command:
```commandline
singularity shell  instance://ultra1
singularity shell  ultra.sif
```


## check instances
List all running containers
```commandline
singularity instance list
```


## Exec command in running container

```commandline
singularity exec -e --pwd /home/ultra my_instance pwd
```

```commandline
singularity exec instance://ultra1 python get_labels_cherry_CO.py
```

# SLURM

## Automatically run scripts batches
RUn process in the background:
```commandline
sbatch train_basic_ultra.sh
```
## Run command and mantain window open with SLURM
RUn process in the current console:
```commandline
srun train_basic_ultra.sh
```


## Run command interactive with SLURM
Run command and mantain control interactively of processes:
```commandline
salloc --cpus-per-task=1 --mem-per-cpu=16g --ntasks=1 --gres=gpu:1 --gpus-per-task=1 --nodelist=v100 --time=15:0 --job-name=train_basic_ultra
srun --pty /bin/bash -l
```
## Useful script commands:
This commands give information about the server and the state of jobs:
```commandline
sinfo
gnodes
squeue
```


# SSH Comunicaction



To copy files within a server and bring them to your local machine you must use the scp command:

```commandline
scp <username.server>@<IP Adress>:/server/path.txt /local/path.txt
scp lcossio@172.16.105.194:/mnt/beegfs/home/lcossio/ultra/runs/train/weights/best.pt /home/luis/2025/ultra/weights/best.pt
```
scp lcossio@172.16.105.194:/mnt/beegfs/home/lcossio/ultra/runs/train/weights/best.pt /home/luis/2025/ultra/weights/best.pt
enviar archivo a server

```commandline
sudo scp -r /home/luis/Downloads/train_cherry.zip  lcossio@172.16.105.194:/mnt/beegfs/home/lcossio/datasets/cherry_CO/train.zip
```






