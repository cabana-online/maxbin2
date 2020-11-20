FROM cimendes/maxbin2:2.2.7-1

# Metadata
LABEL description="A MaxBin2 container."
LABEL maintainer="Alejandro Madrigal Leiva"
LABEL maintainer.email="me@alemadlei.tech"

USER root

ARG USER=cabana
ARG CABANA_USER_ID=1000
ARG CABANA_GROUP_ID=1000

ENV HOME /home/$USER

# Creates work user.
RUN \
    addgroup --gid "${CABANA_GROUP_ID}" --quiet $USER; \
    adduser --gid "${CABANA_GROUP_ID}" --uid ${CABANA_USER_ID} --disabled-password --gecos "" $USER;

# Sets working directory.
WORKDIR $HOME

# Creates the tools folder.
RUN mkdir data tools

# Sets ownership.
RUN chown -R $USER:$USER $HOME && \
    mkdir -p $HOME/CABANA

# Changes to work user.
USER $USER

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]