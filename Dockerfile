FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install -y build-essential libssl-dev libffi-dev cmake git wget ffmpeg nvidia-cuda-toolkit libatlas-base-dev gfortran


WORKDIR /app
RUN pip3 uninstall -y cmake

COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip3 install runpod

# COPY . /app
ENV LD_LIBRARY_PATH /opt/conda/lib/python3.10/site-packages/nvidia/cublas/lib:/opt/conda/lib/python3.10/site-packages/nvidia/cudnn/lib:${LD_LIBRARY_PATH}
