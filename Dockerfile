FROM jenkins/jenkins:lts

USER root

# Install dependencies and sudo
RUN apt-get update && \
apt-get install maven -y \
apt-get clean

# Add jenkins user to sudoers
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Fix permissions for Jenkins home directory
RUN chown -R jenkins:jenkins /var/jenkins_home

USER jenkins
