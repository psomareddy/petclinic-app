#!/bin/bash

export OTEL_SERVICE_NAME=petclinic
export OTEL_RESOURCE_ATTRIBUTES=deployment.environment=${HOSTNAME},version=1.1.0
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317

JAVA_OPTIONS=" "

cd /home/ubuntu/workshop/petclinic
nohup java \
$JAVA_OPTIONS \
-Dotel.service.name=$OTEL_SERVICE_NAME \
-Dotel.resource.attributes=$OTEL_RESOURCE_ATTRIBUTES \
-Dsplunk.metrics.enabled=true \
-jar /home/ubuntu/workshop/petclinic/target/spring-petclinic-*.jar \
--spring.profiles.active=mysql &
