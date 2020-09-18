pipelineJob('pipeline') {
    
    parameters {
        stringParam('TARGET_BUILD_VERSION', '', 'Version of the container to build')
        stringParam('SOURCE_GIT_URL', '', 'Source of the git repository to build')
        stringParam('QUAY_BEARER_TOKEN', '', '')
    }

    definition {
        cps {
            script(readFileFromWorkspace('pipeline/container-image-builder.groovy'))
            sandbox()
        }
    }
}
