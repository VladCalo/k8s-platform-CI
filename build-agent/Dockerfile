FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    openjdk-17-jdk \
    python3 python3-pip python3-venv python3-dev python3-kubernetes \
    curl wget git unzip \
    snapd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download Jenkins agent JAR
RUN curl -fsSL https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/4.13/remoting-4.13.jar -o /usr/share/jenkins/agent.jar

# Configure Python
RUN python3 -m pip install --upgrade pip setuptools wheel && \
    ln -sf /usr/bin/python3 /usr/local/bin/python && \
    ln -sf /usr/bin/pip3 /usr/local/bin/pip

# Install Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y terraform && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN apt-get update && \
    apt-get install -y ansible && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install kubectl via snap
RUN snap install kubectl --classic

# Install Go
RUN curl -fsSL https://go.dev/dl/go1.21.0.linux-arm64.tar.gz | tar -C /usr/local -xzf - && \
    echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

# Install Helm
RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
    echo "deb [arch=arm64 signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install -y helm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Multipass
RUN snap install multipass --classic

# Set PATH
ENV PATH="/usr/local/go/bin:$PATH"

# Create startup script for multipass
RUN echo '#!/bin/bash\nmultipass start || true' > /usr/local/bin/start-multipass && \
    chmod +x /usr/local/bin/start-multipass

# Create jenkins user
RUN useradd -m -s /bin/bash jenkins && \
    mkdir -p /workspace && \
    chown jenkins:jenkins /workspace

# Switch to jenkins user
USER jenkins

WORKDIR /workspace
