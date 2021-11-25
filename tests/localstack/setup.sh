#!/bin/bash

awslocal s3api create-bucket --bucket "$PAY_BUCKET_NAME"
awslocal sqs create-queue --queue-name "$PAY_QUEUE_NAME"
awslocal s3 cp /test-message "s3://$PAY_BUCKET_NAME/test-message"
