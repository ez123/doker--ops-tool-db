FROM sunfoxcz/baseimage

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN \
    DEBIAN_FRONTEND=noninteractive \
        apt-get update \
    && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get install -y \
            \
            ca-certificates \
            openssl \
            ssl-cert \
            openssh-client \
            inetutils-ping \
            \
            bash \
            less \
            nano \
            \
            curl \
            wget \
            \
            realpath \
            virt-what \
            cpu-checker \
            zip \
            xz-utils \
            \
            git \
            \
            mc \
            mosh \
            screen \
            dos2unix \
            deborphan \
            lsscsi \
            \
            iotop \
            htop \
            atop \
            sysstat \
            dstat \
            iftop \
            ifstat \
            bmon \
            \
            tcptrack \
            iptraf \
            nethogs \
            lsof \
            procinfo \
            util-linux \
            mtr \
            \
            postgresql-client \
            mysql-client \
            mongodb-clients \
    && \
    \
    apt-get clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/*               \
        /var/tmp/*           \


