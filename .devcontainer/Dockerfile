FROM eclipse-temurin:25-jdk@sha256:18755606ff20b3871244a75b026eaf5513b93739974100be9d86362f9bc4f98b

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
