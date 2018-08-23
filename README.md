jupyter_playground
====
## Overview  
Jupyter nootbook server for remote machines.
It works on docker.

## Dependence  
* docker  
* docker-compose  
* cuda>=9.0  

## Usage
1. Install jupyter-playground on remote machine.  
`git clone https://github.com/tattaka/jupyter_playground.git`

2. Put working directory in repository.  
`mv /your/workspace jupyter_playground/`  
or  
`cp /your/workspace jupyter_playground/`

3. Build jupyter_playground.  
`cd jupyter_playground`  
`./BUILD-DOCKER-IMAGE.sh`

4. Run Docker Container.  
`./RUN-DOCKER-CONTAINER.sh`

5. Exec jupyter_notebook (and tensorboard).  
`docker exec username_jupyter_1 nohup jupyter notebook --allow-root >> jupyter.log 2>&1 &`  
`docker exec username_jupyter_1 nohup tensorboard --logdir=/root/your/log/path`

6. Login to remote machine from your client machine.  
`ssh -L 8888:localhost:8888 (-L 6006:localhost:6006) -l user_name server.address`

