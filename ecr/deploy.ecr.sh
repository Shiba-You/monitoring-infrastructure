#!/bin/bash

aws cloudformation create-stack \
  --stack-name shibaMetricsECR \
  --template-body file://template.ecr.yaml \
  --parameters file://parameter.ecr.json