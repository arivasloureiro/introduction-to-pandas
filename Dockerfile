FROM jupyter/datascience-notebook

ARG CONFIG_PATH=docker_config

COPY --chown=jovyan:users config ${CONFIG_PATH}

RUN mkdir -p $(ipython locate profile)/startup && \
    cp -a ${CONFIG_PATH}/startup/* $(ipython locate profile)/startup
RUN pip install -r ${CONFIG_PATH}/requirements.txt
RUN rm -r ${CONFIG_PATH}