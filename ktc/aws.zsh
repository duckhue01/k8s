export BUCKET_NAME=dk-test-state-bucket
export KOPS_STATE_STORE=s3://dk-test-state-bucket
export REGION=ap-southeast-1

aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --region $REGION --create-bucket-configuration LocationConstraint=$REGION

aws s3api put-bucket-versioning --bucket $BUCKET_NAME  --versioning-configuration Status=Enabled

aws s3api put-bucket-encryption --bucket $BUCKET_NAME --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

