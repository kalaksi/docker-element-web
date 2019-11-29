FROM nginx:1.16.1
LABEL maintainer="kalaksi@users.noreply.github.com"

ARG RIOTWEB_VERSION="v1.5.5"

# Using a random UID/GID in range 65536-200000 instead of the default system UID
# which has a greater possibility for collisions with the host and other containers.
ENV RIOTWEB_UID="93522"
ENV RIOTWEB_GID="93522"

COPY nginx-default.conf /etc/nginx/conf.d/default.conf
# Prepare for running nginx as non-root
RUN touch /var/run/nginx.pid && \
    chown -R ${RIOTWEB_UID}:${RIOTWEB_GID} /var/run/nginx.pid && \
    chown -R ${RIOTWEB_UID}:${RIOTWEB_GID} /var/cache/nginx

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates \
      wget && \
    wget "https://github.com/vector-im/riot-web/releases/download/${RIOTWEB_VERSION}/riot-${RIOTWEB_VERSION}.tar.gz" -O "/opt/riot-${RIOTWEB_VERSION}.tar.gz" && \
    tar -xf /opt/riot-${RIOTWEB_VERSION}.tar.gz -C /opt && \
    chown -R ${RIOTWEB_UID}:${RIOTWEB_GID} /opt/riot-${RIOTWEB_VERSION} && \
    ln -s /opt/riot-${RIOTWEB_VERSION} /opt/riot-web && \
    rm /opt/riot-${RIOTWEB_VERSION}.tar.gz && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove --purge -y \
      ca-certificates \
      wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Remember! Running riot-web on the same domain as other web services is not recommended:
# https://github.com/vector-im/riot-web#important-security-note
EXPOSE 8080
USER ${RIOTWEB_UID}:${RIOTWEB_GID}
CMD ["nginx", "-g", "daemon off;"]
