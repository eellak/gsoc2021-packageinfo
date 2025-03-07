# Copyright 2021 Ioannis Papadopoulos
# SPDX-License-Identifier: AGPL-3.0-or-later

FROM fedora:34

RUN yum install -y yum-utils 
RUN yum install -y cpio
RUN yum install -y python3-pip

WORKDIR /collector
COPY requirements.txt /collector
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

COPY yum_collector.py /collector

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

CMD ["python3", "-u", "yum_collector.py"]
