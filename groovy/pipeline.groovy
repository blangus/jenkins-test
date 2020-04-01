pipelineJob('pipeline') {
    
    parameters {
        stringParam('myParameterName', 'my default stringParam value', 'my description')
    }

    definition {
        cps {
            script(readFileFromWorkspace('pipeline/container-image-builder.groovy'))
            sandbox()
        }
    }
}
