pipelineJob('pipeline') {
    definition {
        cps {
            script(readFileFromWorkspace('pipeline/container-image-builder.groovy'))
            sandbox()
        }
    }
}
