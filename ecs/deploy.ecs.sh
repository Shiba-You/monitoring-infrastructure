#!/bin/bash

aws cloudformation create-stack \
  --stack-name shibaMetricsPrometheusECS \
  --template-body file://template.ecs.yaml \
  --parameters file://parameter.ecs.json \
  --capabilities CAPABILITY_NAMED_IAM