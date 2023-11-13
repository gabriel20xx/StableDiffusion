# Stage 1: Build and prepare the application
FROM debian:latest
WORKDIR /app

# For Nvidia GPU
ENV NVIDIA_VISIBLE_DEVICES="all"
ENV NVIDIA_DRIVER_CAPABILITIES="all"

# From Stable Diffusion
ENV COMMANDLINE_ARGS=""

RUN apt update && \
	apt upgrade -y && \
	apt install wget git python3 python3-venv libgl1 libglib2.0-0 screen jq -y
RUN useradd -ms /bin/bash user

# Stage 2: Prepare Stable Diffusion
WORKDIR /home/user
USER user
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
RUN chmod +x stable-diffusion-webui/webui.sh
RUN chown user:user stable-diffusion-webui/webui.sh

# Stage 4: Prepare Start Script
WORKDIR /app
COPY --chown=user:user entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
EXPOSE 7860
ENTRYPOINT ["/app/entrypoint.sh"]
