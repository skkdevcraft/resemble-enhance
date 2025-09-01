FROM pytorch/pytorch:2.1.1-cuda12.1-cudnn8-devel

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
    git-lfs \
    libsox-dev \
    ffmpeg \
 && rm -rf /var/lib/apt/lists/*

ENV CUDA_HOME=/usr/local/cuda
ENV PATH=$CUDA_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

WORKDIR /workspace

RUN mkdir input

# Clone from GitHub (ensures git-lfs works inside container)
# RUN git clone https://github.com/resemble-ai/resemble-enhance.git
COPY . /workspace/resemble-enhance
WORKDIR /workspace/resemble-enhance
RUN git lfs install && git lfs pull

# install dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt
RUN pip install "numpy<2"
RUN pip install "deepspeed<0.14"

# install the package
RUN pip install -e .

WORKDIR /workspace

COPY docker/convert_audio.sh .
COPY docker/denoise.sh .
COPY docker/enhance.sh .

RUN chmod +x convert_audio.sh enhance.sh denoise.sh
