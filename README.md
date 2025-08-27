# K8s Platform CI

## Quick Setup

```bash
# Clone and setup
git clone <your-repo-url> k8s-platform-ci
cd k8s-platform-ci

# Run automated setup
chmod +x setup.sh
./setup.sh
```

## Manual Setup

```bash
# 1. Start Jenkins
docker compose up -d

# 2. Get admin password
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

# 3. Access Jenkins UI
# Open http://RPI_IP:8088 in browser
# Complete initial setup with admin password

# 4. Start build agent
docker compose -f build-agent/docker-compose.yml up -d

# 5. Add agent in Jenkins
# Manage Jenkins → Manage Nodes and Clouds → New Node
# Name: build-agent-1
# Remote root directory: /workspace
# Launch method: Launch agents via Java Web Start
```

## Build Agent Tools

The build agent includes all required tools:

- **Terraform**: Infrastructure provisioning
- **Ansible**: Configuration management
- **kubectl**: Kubernetes CLI
- **Go**: Template generation
- **Helm**: Chart management
- **Multipass**: Local VM management
- **Python**: Ansible dependencies

```
