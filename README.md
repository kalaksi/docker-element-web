
## Repositories
- [GitLab repository](https://gitlab.com/kalaksi-containers/element-web/) (image: `registry.gitlab.com/kalaksi-containers/element-web`)
- [Docker Hub repository](https://hub.docker.com/r/kalaksi/element-web/) (image: `docker.io/kalaksi/element-web`)
- [GitHub repository](https://github.com/kalaksi/docker-element-web)

## What is this container for?
This container runs Nginx as a non-root user serving Element web-UI.

## Why use this container?
**Simply put, this container has been written with simplicity and security in mind.**

Many community containers run unnecessarily with root privileges by default and don't provide help for dropping unneeded CAPabilities either.
On top of that, overly complex shell scripts, monolithic designs and unofficial base images make it harder to verify the source among other issues.

To remedy the situation, these images have been written with security and simplicity in mind.

|Requirement                |Status|Details|
|---------------------------|:----:|-------|
|Don't run as root          |✅    | Never run as root unless necessary. |
|Transparent build process  |✅    | For verifying that the container matches the code. See GitLab CI. |
|Official base image        |✅    | |
|Drop extra CAPabilities    |✅    | See ```docker-compose.yml``` |
|No default passwords       |✅    | No static default passwords. That would make the container insecure by default.|
|Support secrets-files      |✅    | Support providing e.g. passwords via files instead of environment variables.|
|Handle signals properly    |✅    | |
|Simple Dockerfile          |✅    | No overextending the container's responsibilities. And keep everything in the Dockerfile if reasonable. |
|Versioned tags             |✅    | Offer versioned tags for stability.|

## Running this container
See the example ```docker-compose.yml``` in the source repository.

### Supported tags
See the ```Tags``` tab on Docker Hub for specifics. Basically you have:
- The default ```latest``` tag that always has the latest changes.
- Minor versioned tags (follow Semantic Versioning), e.g. ```1.1``` which would follow branch ```1.1.x``` on GitHub.

### Configuration
You'll need to provide the configuration for the container at ```/opt/element-web/config.json``` (as shown in ```docker-compose.yml```).  
Sample configuration files can be found in element-web root directory or in the [official repository](https://github.com/vector-im/element-web/blob/v1.0.1/config.sample.json).

## Development

### Contributing
See the repository on <https://github.com/kalaksi/docker-element-web>.
All kinds of contributions are welcome!

## License
Copyright (c) 2018 kalaksi@users.noreply.github.com. See [LICENSE](https://github.com/kalaksi/docker-element-web/blob/master/LICENSE) for license information.  

As with all Docker images, the built image likely also contains other software which may be under other licenses (such as software from the base distribution, along with any direct or indirect dependencies of the primary software being contained).  
  
As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

