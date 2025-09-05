#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED', String channel = '#general') {
    // Set default color
    def colorCode = '#FF0000' // RED for failure
    if (buildStatus == 'SUCCESS') {
        colorCode = '#00FF00' // GREEN
    } else if (buildStatus == 'UNSTABLE') {
        colorCode = '#FFFF00' // YELLOW
    }

    // Send Slack notification
    slackSend(
        channel: #all-devops,
        color: colorCode,
        message: "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    )
}

