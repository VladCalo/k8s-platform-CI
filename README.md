# K8s Platform CI


## Quick Setup

- Installation on RPI, only ARM64 and install QEMU/KVM
- **Purpose**: CI for (only multipass for now):
    - https://github.com/VladCalo/Ephemeral-Environment-Factory
    - https://github.com/VladCalo/GitOps-Platform-Factory


- Will use Jenkins container and LXD with multipass inside as jenkins agent

```bash
git clone <repo>
cd k8s-platform-ci

# Run automated setup
chmod +x setup.sh
bash setup.sh
```