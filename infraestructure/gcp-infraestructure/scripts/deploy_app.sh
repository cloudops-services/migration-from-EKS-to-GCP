#!/bin/bash

cd ../app
zip -r app.zip .
gcloud app deploy app.yaml --project=$1 --quiet
rm app.zip
