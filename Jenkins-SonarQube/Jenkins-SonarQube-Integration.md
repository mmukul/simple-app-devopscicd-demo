## Jenkins for SonarQube integration

1.  Install the SonarQube extension for Jenkins.
2.  Install the SonarScanner from Jenkins.

### [Installing the SonarQube extension for Jenkins](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/ci-integration/jenkins-integration/global-setup/#install-extension "Installing the SonarQube extension for Jenkins")

[SonarQube extension for Jenkins](https://plugins.jenkins.io/sonar/ "SonarQube extension for Jenkins") version 2.11 or later is required.

Proceed with 1st Step:

1.  From the Jenkins Dashboard, navigate to **Manage Jenkins** > **Manage Plugins** and install the **SonarQube Scanner** plugin.
2.  Back at the Jenkins Dashboard, navigate to **Credentials** > **System** from the left navigation.
3.  Click the **Global credentials (unrestricted)** link in the **System** table.
4.  Click **Add credentials** in the left navigation and add the following information:
    -   **Kind**: Secret Text
    -   **Scope**: Global
    -   **Secret**: Generate a token at **User** > **My Account** > **Security** in SonarQube, and copy and paste it here.
5.  Click **OK**.


Proceed with 2nd Step:

6.  From the Jenkins Dashboard, navigate to **Manage Jenkins > Configure System**.
7.  From the **SonarQube Servers** section, click **Add SonarQube**. Add the following information:
    -   **Name**: Give a unique name to your SonarQube instance.
    -   **Server URL**: Your SonarQube instance URL.
    -   **Credentials**: Select the credentials created during step 4.
8.  Click **Save**

## [Installing the SonarScanner instance(s)](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/ci-integration/jenkins-integration/global-setup/#install-scanner "Installing the SonarScanner instance(s)")

From Jenkins, install and configure the SonarScanner instance(s). This step depends on the project type.

### MAVEN

1.  Log into Jenkins as an administrator and go to  **Manage Jenkins > Configure System.**
2.  Scroll to the  **SonarQube servers**  section and check  **Enable injection of SonarQube server configuration as build environment variables.**