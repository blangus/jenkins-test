import jenkins.model.*
import hudson.security.*
import jenkins.AgentProtocol
import hudson.security.csrf.DefaultCrumbIssuer

def env = System.getenv()

def jenkins = Jenkins.getInstance()
if(!(jenkins.getSecurityRealm() instanceof HudsonPrivateSecurityRealm))
    jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))

if(!(jenkins.getAuthorizationStrategy() instanceof GlobalMatrixAuthorizationStrategy))
    jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

// create new Jenkins user account
// username & password from environment variables
def user = jenkins.getSecurityRealm().createAccount("admin", "admin")
user.save()
jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, "admin")

jenkins.setCrumbIssuer(new DefaultCrumbIssuer(true))

System.setProperty('org.apache.commons.jelly.tags.fmt.timeZone', 'Europe/Amsterdam')

jenkins.save()