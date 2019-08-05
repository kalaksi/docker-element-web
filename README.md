
## Repositories
- [Docker Hub repository](https://registry.hub.docker.com/u/kalaksi/riot-web/)
- [GitHub repository](https://github.com/kalaksi/docker-riot-web)

## What is this container for?
This container runs Nginx as a non-root user serving Riot web-UI.

## Why use this container?
**Simply put, this container has been written with simplicity and security in mind.**

Surprisingly, _many_ community containers run unnecessarily with root privileges by default and don't provide help for dropping unneeded CAPabilities either.
On top of that, overly complex shell scripts, monolithic designs and unofficial base images make it harder to verify the source among other issues.

To remedy the situation, these images have been written with security and simplicity in mind.

|Requirement                   |Status|Details|
|------------------------------|:----:|-------|
|Don't run container as root   |✅    | Never run as root unless necessary. |
|Official base image           |✅    | |
|Drop extra CAPabilities       |✅    | See ```docker-compose.yml``` |
|No default passwords          |✅    | No static default passwords. That would make the container insecure by default.|
|Support secrets-files         |✅    | Support providing e.g. passwords via files instead of environment variables.|
|Handle signals properly       |✅    | |
|Simple Dockerfile             |✅    | Keep everything in the Dockerfile if reasonable.|
|Versioned tags                |✅    | Offer versioned tags for stability.|

## Running this container
See the example ```docker-compose.yml``` in the source repository.

### Supported tags
See the ```Tags``` tab on Docker Hub for specifics. Basically you have:
- The default ```latest``` tag that always has the latest changes.
- Minor versioned tags (follow Semantic Versioning), e.g. ```1.1``` which would follow branch ```1.1.x``` on GitHub.

### Configuration
You'll need to provide the configuration for the container at ```/opt/riot-web/config.json``` (as shown in ```docker-compose.yml```).  
Sample configuration files can be found in riot-web root directory or in the [official repository](https://github.com/vector-im/riot-web/blob/v1.0.1/config.sample.json).

## Development

### Contributing
See the repository on <https://github.com/kalaksi/docker-riot-web>.
All kinds of contributions are welcome!

## License
View [license information](https://github.com/kalaksi/docker-riot-web/blob/master/LICENSE) for the software contained in this image.
As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
