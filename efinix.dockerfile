#pull stable version of CI image from docker hub
FROM docker.io/zephyrprojectrtos/ci:v0.24.9-amd64

USER root
ARG S6_OVERLAY_VERSION=3.1.0.1
ENV DEBIAN_FRONTEND noninteractive

SHELL ["/bin/bash", "-c"]

# Install packages
RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install --no-install-recommends -y nano \
	usbutils \
	bash-completion \
	curl && \
	curl -SL https://github.com/efinix-sse/openocd_riscv/releases/download/v2022.2/openocd_linux.zip -o /tmp/openocd_linux.zip && \
    unzip /tmp/openocd_linux.zip -d /opt && \
    rm /tmp/openocd_linux.zip && chmod +x /opt/openocd
#	openbox \
#	python-xdg \
#	libpython3.8-dev \
#	xvfb \
#	xterm \
#	xz-utils

# Clean up stale packages
RUN apt-get clean -y && \
	apt-get autoremove --purge -y && \
	rm -rf /var/lib/apt/lists/*

RUN echo "export PATH=\"/opt/:$PATH\"" >> /home/user/.bashrc

#Let s6 take care of the rest 
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
ENTRYPOINT ["/init"]

WORKDIR /zephyr
USER user

