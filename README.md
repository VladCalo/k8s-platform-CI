# K8s Platform CI

Minimal CI setup for testing Ephemeral Environment Factory and GitOps Platform Factory. I used RPI5 for my Jenkins (!!! ARM64 docker images)

## Setup Steps

```bash
# Clone on RPi
git clone <your-repo-url> k8s-platform-ci
cd k8s-platform-ci

# Start Jenkins
docker compose up -d

# Enter Jenkins container
docker exec -it jenkins /bin/bash
cat /var/jenkins_home/secrets/initialAdminPassword

# Test Jenkins UI
# Open http://RPI_IP:8088 in browser
# Login with: admin / <password-from-step-3>

# Start build-env container
docker compose -f build-env/docker-compose.yml up -d

# From inside Jenkins, enter build-env container
docker exec -it build-env /bin/bash

# Inside build-env container, test tools:
terraform --version
kubectl version --client
go version
helm version
multipass --version
```
