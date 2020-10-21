FROM jenkins/jenkins:2.249.1-lts

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG $JENKINS_HOME/casc_configs/
ENV JENKINS_REF /usr/share/jenkins/ref

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# Setup defaults
COPY casc_configs $JENKINS_REF/casc_configs/
RUN mkdir -p $JENKINS_REF/init.groovy.d/
COPY init.groovy $JENKINS_REF/init.groovy.d/init.groovy
