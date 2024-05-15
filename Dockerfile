# Copyright (c) 2018 kalaksi@users.noreply.github.com.
# This work is licensed under the terms of the MIT license. For a copy, see <https://opensource.org/licenses/MIT>.

FROM nginx:1.25.5
LABEL maintainer="kalaksi@users.noreply.github.com"

ARG ELEMENTWEB_VERSION="v1.11.66"

# Using a random UID/GID in range 65536-200000 instead of the default system UID
# which has a greater possibility for collisions with the host and other containers.
ENV ELEMENTWEB_UID="93522"
ENV ELEMENTWEB_GID="93522"

COPY nginx-default.conf /etc/nginx/conf.d/default.conf
# Prepare for running nginx as non-root
RUN touch /var/run/nginx.pid && \
    chown -R ${ELEMENTWEB_UID}:${ELEMENTWEB_GID} /var/run/nginx.pid && \
    chown -R ${ELEMENTWEB_UID}:${ELEMENTWEB_GID} /var/cache/nginx

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates \
      wget && \
    wget "https://github.com/element-hq/element-web/releases/download/${ELEMENTWEB_VERSION}/element-${ELEMENTWEB_VERSION}.tar.gz" -O "/opt/element-${ELEMENTWEB_VERSION}.tar.gz" && \
    tar -xf /opt/element-${ELEMENTWEB_VERSION}.tar.gz -C /opt && \
    chown -R ${ELEMENTWEB_UID}:${ELEMENTWEB_GID} /opt/element-${ELEMENTWEB_VERSION} && \
    ln -s /opt/element-${ELEMENTWEB_VERSION} /opt/element-web && \
    rm /opt/element-${ELEMENTWEB_VERSION}.tar.gz && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove --purge -y \
      ca-certificates \
      wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

EXPOSE 8080
USER ${ELEMENTWEB_UID}:${ELEMENTWEB_GID}
CMD ["nginx", "-g", "daemon off;"]
