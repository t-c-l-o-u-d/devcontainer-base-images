# GNU Affero General Public License v3.0 or later (see COPYING or https://www.gnu.org/licenses/agpl.txt)

FROM quay.io/fedora/fedora-minimal:latest

# pull in USER from devcontainer.json
ARG USER

# setup bash
COPY bashrc /etc/skel/.bashrc
COPY aliases /etc/skel/.config/bash/aliases
COPY functions /etc/skel/.config/bash/functions

# setup passwordless sudo for the wheel group
RUN mkdir --parents /etc/sudoers.d &&\
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel-nopasswd

# allow manpages to be installed
RUN sed --in-place --expression 's/tsflags\=nodocs//g' /etc/dnf/dnf.conf

# install some packages
RUN dnf5 install --assumeyes \
    7z \
    bash-completion \
    coreutils \
    curl \
    file \
    git \
    gzip \
    htop \
    man-db \
    rsync \
    shadow-utils \
    sudo \
    tar \
    unrar \
    unzip \
    vim \
    watch \
    which \
    xdg-utils

# remove some unnecessary packages
RUN dnf5 remove --assumeyes \
    nano

# add the USER to the image
RUN useradd --groups wheel ${USER}

# =======================================
# repository specific commands start here
# =======================================

# install bash linters
RUN dnf5 install --assumeyes \
    nodejs-bash-language-server \
    ShellCheck \
    shfmt

# =====================================
# repository specific commands end here
# =====================================

# clean up after ourselves
RUN dnf5 clean all

# ensure the image starts as USER
USER ${USER}
