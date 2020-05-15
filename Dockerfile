FROM jenkins/jenkins

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# Setup defaults
COPY jenkins.yaml $JENKINS_HOME/jenkins.yaml
RUN mkdir -p $JENKINS_HOME/init.groovy.d/
COPY init.groovy $JENKINS_HOME/init.groovy.d/init.groovy
