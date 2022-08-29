#!/bin/bash
sed "s/tagVersion/$1/g" k8s-manifest/springboot-deployment.yaml > springboot-deployment.yaml
echo 'updated tag'
