#!/bin/sh
echo "Starting module called 02-login" >> /tmp/progress.log

mkdir -pvm 0755 /etc/osbuild-composer/repositories
cp /usr/share/osbuild-composer/repositories/*.json /etc/osbuild-composer/repositories/
sed -i -e 's|cdn.redhat.com|demosat-ha.infra.demo.redhat.com/pulp/repos/Red_Hat_RHDP_Labs/Library/zt-rhelbu|' /etc/osbuild-composer/repositories/rhel-10.json
systemctl restart osbuild-worker@.service.d osbuild-worker@1.service osbuild-composer.service
