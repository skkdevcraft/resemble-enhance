# FROM pytorch/pytorch:2.1.1-cuda12.1-cudnn8-runtime
FROM pytorch/pytorch:2.8.0-cuda12.9-cudnn9-runtime

# the resemble-enhance download script uses `git lfs pull` to
# download the model from huggingface, which will fail unless 
# this is installed.
RUN apt update && \
    apt install -y git-lfs && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN mkdir input
# RUN pip install resemble-enhance --upgrade

# Copy the local resemble-enhance source code
COPY . /app/resemble-enhance

# Install from the copied source
RUN cd /app/resemble-enhance && \
    pip install -e .

# RUN cd /app/resemble-enhance && \
#     pip install -r requirements.txt && \
#     pip install -e . && \
#     pip cache purge

COPY docker/convert_audio.sh .
COPY docker/denoise.sh .
COPY docker/enhance.sh .

RUN chmod +x convert_audio.sh enhance.sh denoise.sh

