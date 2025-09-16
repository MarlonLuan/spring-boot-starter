FROM eclipse-temurin:21.0.8_9-jdk@sha256:2b9cd724df3c0797032bfcfebd268ba89e80a77e93c791c4cecd4d5e1202e027

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
