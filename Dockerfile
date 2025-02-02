FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install pyyaml

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENV PATH="/opt/venv/bin:$PATH"

ENTRYPOINT [ "/entrypoint.sh" ]
