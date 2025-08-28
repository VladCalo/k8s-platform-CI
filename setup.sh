#!/bin/bash

echo "Setting up K8s Platform CI..."

# Start Jenkins
echo "Starting Jenkins..."
docker compose up -d

# Wait for Jenkins to be ready
echo "Waiting for Jenkins to be ready..."
sleep 5

# # Get Jenkins admin password
# echo "Getting Jenkins admin password..."
# PASSWORD=$(docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword)
# echo "Jenkins admin password: $PASSWORD"

echo "Setup complete!"
echo "Access Jenkins at: http://$(hostname -I | awk '{print $1}'):8088"
# echo "Admin password: $PASSWORD"
echo "Admin password: admin"
