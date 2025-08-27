#!/bin/bash

# Wait for Jenkins to be ready
echo "Waiting for Jenkins to be ready..."
while ! curl -s http://jenkins:8080 > /dev/null; do
    sleep 5
done

# Start Jenkins agent
echo "Starting Jenkins agent..."
java -jar /usr/share/jenkins/agent.jar \
    -jnlpUrl http://jenkins:8080/computer/${JENKINS_AGENT_NAME}/jenkins-agent.jnlp \
    -secret ${JENKINS_SECRET} \
    -workDir /workspace
