FROM docker.io/zephyrprojectrtos/ci:v0.24.9-amd64

USER root
ARG S6_OVERLAY_VERSION=3.1.0.1
ENV DEBIAN_FRONTEND noninteractive


# Install packages
RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install --no-install-recommends -y nano \
	minicom \
	usbutils \
	bash-completion

# Clean up stale packages
RUN apt-get clean -y && \
	apt-get autoremove --purge -y && \
	rm -rf /var/lib/apt/lists/*

#RUN echo "export PATH=\"/opt/:$PATH\"" >> /home/user/.bashrc
RUN echo 'export PATH="$PATH:/zephyr/bin"' | tee /etc/profile.d/openocd.sh
RUN usermod -aG dialout user

#Let s6 take care of the rest 
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
ENTRYPOINT ["/init"]

WORKDIR /zephyr
USER user

