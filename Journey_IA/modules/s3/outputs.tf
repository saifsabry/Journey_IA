# Outputs for S3 Buckets

output "autohosting_files_bucket_name" {
  description = "Name of the autohosting files bucket"
  value       = aws_s3_bucket.autohosting_files.id
}

output "autohosting_files_bucket_arn" {
  description = "ARN of the autohosting files bucket"
  value       = aws_s3_bucket.autohosting_files.arn
}

output "one_journey_data_bucket_genai_name" {
  description = "Name of the One Journey data bucket"
  value       = aws_s3_bucket.one_journey_data_bucket_genai.id
}

output "one_journey_data_bucket_genai_arn" {
  description = "ARN of the One Journey data bucket"
  value       = aws_s3_bucket.one_journey_data_bucket_genai.arn
}

output "one_journey_files_bucket_genai_name" {
  description = "Name of the One Journey files bucket"
  value       = aws_s3_bucket.one_journey_files_bucket_genai.id
}

output "one_journey_hosting_bucket_genai_name" {
  description = "Name of the One Journey hosting bucket"
  value       = aws_s3_bucket.one_journey_hosting_bucket_genai.id
}

output "one_journey_transcriptions_genai_name" {
  description = "Name of the One Journey transcriptions bucket"
  value       = aws_s3_bucket.one_journey_transcriptions_genai.id
}

output "all_bucket_names" {
  description = "List of all S3 bucket names"
  value = [
    aws_s3_bucket.autohosting_files.id,
    aws_s3_bucket.oj_characters.id,
    aws_s3_bucket.oj_gellogoogle.id,
    aws_s3_bucket.oj_hellochirp2.id,
    aws_s3_bucket.oj_hellodeepgram.id,
    aws_s3_bucket.oj_hellodeepgram_2.id,
    aws_s3_bucket.oj_stt_hosting.id,
    aws_s3_bucket.oj_sttva.id,
    aws_s3_bucket.oj_transcripciones_genai.id,
    aws_s3_bucket.one_journey_data_bucket_genai.id,
    aws_s3_bucket.one_journey_files_bucket_genai.id,
    aws_s3_bucket.one_journey_hosting_bucket_genai.id,
    aws_s3_bucket.one_journey_transcriptions_genai.id,
    aws_s3_bucket.stt_transcripciones.id,
    aws_s3_bucket.stt_transcripciones_genai.id
  ]
}