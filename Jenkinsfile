pipeline
{
    agent any
    environment 
    {
        // Docker Hub credentials ID stored in Jenkins
        DOCKERHUB_CREDENTIALS ='CYBR-3120'
        IMAGE_NAME ='tommy6769/homework-2'
    }

    stages
    {
        stage('Cloning Git')
        {
            steps
            {
                checkout scm
            }
        }

        stage('SAST-TEST')
        {
            agent any
            steps
            {
                script
                    {
                        echo "Place holder for SAST Stuff"
                    }
            }
        }

        stage('BUILD-AND-TAG')
        {
            agent { label 'Levi-CYBER-3120-app-server'}
            
            steps
            {


                script
                {
                    // Build docker image using jenkins docker pipeline API
                    echo "Building Docker image ${IMAGE_NAME}..."
                    def app = docker.build("${IMAGE_NAME}")
                    app.tag("latest", true)

                }
            }
        }

        stage('POST-TO-DOCKERHUB')
        {
            agent { label 'Levi-CYBER-3120-app-server'}
            
            steps
            {


                script
                {
                    echo "Pushing image ${IMAGE_NAME}:latest to Docker Hub..."
                    docker.withRegistry('https://registry.hub.docker.com',"${DOCKERHUB_CREDENTIALS}")
                    {
                     app.push("latest")
                    }

                }
            }
        }

        stage('DAST')
        {
            steps
            {
                sh 'echo Running DAST scan...'
            }
        }        

        stage('Deployment')
        {
            agent { label 'Levi-CYBER-3120-app-server'}
            
            steps
            {
                echo 'Starting deployment using docker-compose...'
                script
                {
                    dir("${WORKSPACE}")
                    {
                    sh '''
                        docker-compose down
                        docker-compose up -d
                        docker ps
                    '''
                
                }
                    echo 'Deployment completed successfully!'
            }
        }        
    }        
}
