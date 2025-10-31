# My First Pipeline Project

This project demonstrates Jenkins Shared Library Pipeline usage.

## Project Structure
```
my-first-pipeline-project/
├── Jenkinsfile          # Minimal Jenkinsfile that calls shared library
├── index.html          # Simple web application
├── test.sh             # Automated tests
├── Dockerfile          # Container configuration
└── README.md           # This file
```

## Jenkins Pipeline Library

The pipeline is defined in the shared library at `/home/jmendez/jenkins-pipeline-library/vars/myWebAppPipeline.groovy`

## Pipeline Features

- ✅ **Automated Checkout**: Pulls code from repository
- ✅ **Validation**: Checks for required files
- ✅ **Testing**: Runs automated tests
- ✅ **Docker Build**: Creates containerized application
- ✅ **Deployment**: Automatically deploys to local environment
- ✅ **Health Check**: Verifies deployment success
- ✅ **Cleanup**: Removes old Docker images

## Usage

### Option 1: Use Default Configuration
```groovy
@Library('my-pipeline-library') _
myWebAppPipeline()
```

### Option 2: Use Custom Configuration
```groovy
@Library('my-pipeline-library') _
myWebAppPipeline([
    appName: 'my-custom-app',
    dockerPort: '3002'
])
```

## Available Pipelines

1. **myWebAppPipeline** - For web applications (current)
2. **myApiPipeline** - For API applications
3. **myUtilityPipeline** - For cleanup and maintenance tasks

## Deployment

After successful pipeline execution, the application will be available at:
- **Default**: http://localhost:3001
- **Custom port**: http://localhost:{dockerPort}

## Testing Locally

Run tests manually:
```bash
./test.sh
```

Build Docker image manually:
```bash
docker build -t my-app .
docker run -p 3001:80 my-app
```