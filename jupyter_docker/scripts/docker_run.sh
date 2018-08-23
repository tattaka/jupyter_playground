docker rm $1
docker run -it --runtime=nvidia --net=host -e DISPLAY=$DISPLAY --name $1\
	-e NVIDIA_DRIVER_CAPABILITIES=all -e NVIDIA_VISIBLE_DEVICES=1 \
	-v $HOME/jupyter_playground/chainer_tutorial:/root/jupyter_playground/chainer_tutorial:rw \
	-v $HOME/jupyter_playground/dl4us:/root/jupyter_playground/dl4us:rw \
	-v $HOME/.Xauthority:/root/.Xauthority:rw anaconda3:chainer
