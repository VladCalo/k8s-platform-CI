# K8s Platform CI

Minimal CI setup for testing Ephemeral Environment Factory and GitOps Platform Factory. I used RPI5 for my Jenkins

## Setup Steps

```bash
# 1. Clone on RPi
git clone <your-repo-url> k8s-platform-ci
cd k8s-platform-ci

# 2. Start Jenkins
docker-compose up -d

# 3. Get Jenkins admin password
docker-compose logs jenkins | grep "Jenkins initial admin password"

# 4. Test Jenkins UI
# Open http://RPI_IP:8088 in browser
# Login with: admin / <password-from-step-3>

# 5. Start build-env container
docker-compose -f build-env/docker-compose.yml up -d

# 6. Enter Jenkins container
docker exec -it jenkins bash

# 7. From inside Jenkins, enter build-env container
docker exec -it k8s-platform-ci-build-env bash

# 8. Inside build-env container, test tools:
terraform --version
kubectl version --client
go version
helm version
multipass --version
```
