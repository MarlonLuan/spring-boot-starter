FROM eclipse-temurin:25-jdk@sha256:d6538ec6e6a6b5dce98a4f34e7b7be7f18e1ed6d99fa6bd9af045057afcf7aea

RUN apt update
RUN apt upgrade -y

RUN apt install bash git -y

RUN rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 10001 appgroup && \
    adduser --uid 10000 --ingroup appgroup --disabled-password --gecos "" appuser

RUN mkdir -p /workspaces && \
    chown -R appuser:appgroup /workspaces

USER appuser

WORKDIR /workspaces

CMD ["sleep", "infinity"]
