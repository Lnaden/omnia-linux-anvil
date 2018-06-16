FROM jchodera/omnia-linux-anvil:texlive18

# Install CUDA 7.5
RUN wget -q http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run && \
    chmod +x cuda_7.5.18_linux.run && \
    source /opt/docker/bin/entrypoint_source && \
    ./cuda_7.5.18_linux.run --silent --no-opengl-libs --toolkit && \
    rm -f cuda_7.5.18_linux.run && \
    rm -rf /usr/local/cuda-7.5/doc && \
    rm -rf /usr/local/cuda-7.5/samples

# Clean up
RUN yum clean -y --quiet expire-cache && \
    yum clean -y --quiet all
