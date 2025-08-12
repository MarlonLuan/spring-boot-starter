FROM eclipse-temurin:21.0.8_9-jdk@sha256:9d2cd32945b17b8687f196c1a9ab664e00726782384f28e61fa99ca310b2697c

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
