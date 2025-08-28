FROM jenkins/jenkins:lts-jdk17

USER root

# Install essential tools
RUN apt-get update && \
    apt-get install -y git curl wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins
