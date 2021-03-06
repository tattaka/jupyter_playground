FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

MAINTAINER tattaka

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git nano net-tools graphviz

RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

RUN pip install --upgrade pip==9.0.3 nltk && pip install \
    cupy \
    h5py \
    opencv-python \
    protobuf \
    chainer \
    chainercv==0.8.0 \
    chainerui \
    tensorflow-gpu \
    keras \
    graphviz \
    jupyterthemes \
    pydot \
    tqdm \
    kaggle
RUN wget https://github.com/sharkdp/bat/releases/download/v0.7.1/bat-musl_0.7.1_amd64.deb && \
    dpkg -i bat-musl_0.7.1_amd64.deb
RUN git clone https://github.com/KaimingHe/deep-residual-networks.git 
#    mv deep-residual-networks/prototxt/ResNet* ~/.chainer/pfnet/chainer/models/
RUN wget http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_16_layers.caffemodel 
#    mv VGG_ILSVRC_16_layers.caffemodel ~/.chainer//pfnet/chainer/models/
WORKDIR /root/jupyter_playground
#RUN jt -t monokai -f inconsolata -N -T 

ENTRYPOINT []
CMD [ "/bin/bash" ]
