FROM eclipse-temurin:25.0.1_8-jdk@sha256:b73804328f4d8e07476f24737fd38cb918842d772cffd71187a6fcfbe9629f65

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
