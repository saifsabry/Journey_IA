#!/bin/bash

# Import script for existing S3 buckets into Terraform state
# This script imports all S3 buckets using the module structure

echo "Starting S3 bucket import process..."
echo "======================================="

# Import each bucket - note the module.s3 prefix
terraform import module.s3.aws_s3_bucket.autohosting_files autohosting-files
terraform import module.s3.aws_s3_bucket.oj_characters oj-characters-12345-lnou0tzreyxh7hqfwvekw
terraform import module.s3.aws_s3_bucket.oj_gellogoogle oj-gellogoogle-hq5cjfybzifwz2585ebtl
terraform import module.s3.aws_s3_bucket.oj_hellochirp2 oj-hellochirp2-ge9unugfmnligurtzmohd
terraform import module.s3.aws_s3_bucket.oj_hellodeepgram oj-hellodeepgram-0qzlwogoxoofw5cs9ujzl
terraform import module.s3.aws_s3_bucket.oj_hellodeepgram_2 oj-hellodeepgram-bfj6gxpdmgtdyu9lm3oht
terraform import module.s3.aws_s3_bucket.oj_stt_hosting oj-stt-hosting-xaiyor7sstvvlkcbnichu
terraform import module.s3.aws_s3_bucket.oj_sttva oj-sttva-wopbamwpm6ttddpmzfwig
terraform import module.s3.aws_s3_bucket.oj_transcripciones_genai oj-transcripciones-genai-svuclmx8jabduiavugxeh
terraform import module.s3.aws_s3_bucket.one_journey_back_as_ecr_g_deployment_1 one-journey-back-as-ecr-g-serverlessdeploymentbuck-dolibyjasqhp
terraform import module.s3.aws_s3_bucket.one_journey_back_as_ecr_g_deployment_2 one-journey-back-as-ecr-g-serverlessdeploymentbuck-rjl82uuxxofm
terraform import module.s3.aws_s3_bucket.one_journey_back_as_ecr_i_deployment one-journey-back-as-ecr-i-serverlessdeploymentbuck-pnfckzyd5aah
terraform import module.s3.aws_s3_bucket.one_journey_back_as_ecs_g_deployment_1 one-journey-back-as-ecs-g-serverlessdeploymentbuck-cfnvdwfpbtsv
terraform import module.s3.aws_s3_bucket.one_journey_back_as_ecs_g_deployment_2 one-journey-back-as-ecs-g-serverlessdeploymentbuck-j9azhf22p0fv
terraform import module.s3.aws_s3_bucket.one_journey_data_bucket_genai one-journey-data-bucket-genai
terraform import module.s3.aws_s3_bucket.one_journey_files_bucket_genai one-journey-files-bucket-genai
terraform import module.s3.aws_s3_bucket.one_journey_front_pipeline_artifacts one-journey-front-pipeline-artifacts-971422687659
terraform import module.s3.aws_s3_bucket.one_journey_genai_deployment one-journey-genai-serverlessdeploymentbucket-r8r10jddmxy6
terraform import module.s3.aws_s3_bucket.one_journey_hosting_bucket_genai one-journey-hosting-bucket-genai
terraform import module.s3.aws_s3_bucket.one_journey_nodes_core_ge_deployment_1 one-journey-nodes-core-ge-serverlessdeploymentbuck-tezd9hxndj5i
terraform import module.s3.aws_s3_bucket.one_journey_nodes_core_ge_deployment_2 one-journey-nodes-core-ge-serverlessdeploymentbuck-xa0dgmpjhd8h
terraform import module.s3.aws_s3_bucket.one_journey_transcriptions_bucket_genai one-journey-transcriptions-bucket-genai
terraform import module.s3.aws_s3_bucket.one_journey_transcriptions_genai one-journey-transcriptions-genai
terraform import module.s3.aws_s3_bucket.onejourney_core_nodes_artifacts onejourney-core-nodes-artifacts-971422687659-v2
terraform import module.s3.aws_s3_bucket.onejourney_genai_back_artifacts onejourney-genai-back-artifacts-971422687659-v2
terraform import module.s3.aws_s3_bucket.onejourney_genai_back_cicd_artifacts onejourney-genai-back-cicd-artifacts-971422687659-v2
terraform import module.s3.aws_s3_bucket.onejourney_genai_cicd_artifacts onejourney-genai-cicd-artifacts-971422687659
terraform import module.s3.aws_s3_bucket.stt_transcripciones stt-transcripciones
terraform import module.s3.aws_s3_bucket.stt_transcripciones_genai stt-transcripciones-genai

# Import versioning for the data bucket if it exists
terraform import module.s3.aws_s3_bucket_versioning.one_journey_data_bucket_genai_versioning one-journey-data-bucket-genai

# Import encryption for the data bucket if it exists
terraform import module.s3.aws_s3_bucket_server_side_encryption_configuration.one_journey_data_bucket_genai_encryption one-journey-data-bucket-genai

echo "======================================="
echo "Import process completed!"
echo "Run 'terraform plan' to verify the import"