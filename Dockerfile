# https://catalog.redhat.com/software/containers/openshift3/jenkins-2-rhel7/581d2f4500e5d05639b6517b?container-tabs=gti
#FROM registry.redhat.io/openshift3/jenkins-2-rhel7 
FROM jenkins/jenkins:2.249.1-lts

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG $JENKINS_HOME/casc_configs/

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# Setup defaults
#COPY jenkins.yaml $JENKINS_HOME/jenkins.yaml
COPY casc_configs $JENKINS_HOME/casc_configs/
RUN mkdir -p $JENKINS_HOME/init.groovy.d/
COPY init.groovy $JENKINS_HOME/init.groovy.d/init.groovy
