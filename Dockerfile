ARG ROOT_CONTAINER=jupyter/base-notebook:latest


FROM $ROOT_CONTAINER

WORKDIR /app

USER root

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    gfortran \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}


RUN pip install -U numpy jupyterlab pandas seaborn tqdm statsmodels openpyxl