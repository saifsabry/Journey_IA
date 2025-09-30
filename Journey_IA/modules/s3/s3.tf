resource "aws_s3_bucket" "autohosting_files" {
  bucket        = "autohosting-files"
  force_destroy = false

}

resource "aws_s3_bucket" "oj_characters" {
  bucket= "oj-characters-12345-lnou0tzreyxh7hqfwvekw"
  

}

resource "aws_s3_bucket" "oj_gellogoogle" {
  bucket = "oj-gellogoogle-hq5cjfybzifwz2585ebtl"
  force_destroy = false

}

resource "aws_s3_bucket" "oj_hellochirp2" {
  bucket = "oj-hellochirp2-ge9unugfmnligurtzmohd"
  force_destroy = false
}

resource "aws_s3_bucket" "oj_hellodeepgram" {
  bucket = "oj-hellodeepgram-0qzlwogoxoofw5cs9ujzl"
  force_destroy = false
}

resource "aws_s3_bucket" "oj_hellodeepgram_2" {
  bucket = "oj-hellodeepgram-bfj6gxpdmgtdyu9lm3oht"
  force_destroy = false
}

resource "aws_s3_bucket" "oj_stt_hosting" {
  bucket = "oj-stt-hosting-xaiyor7sstvvlkcbnichu"
  force_destroy = false
}

resource "aws_s3_bucket" "oj_sttva" {
  bucket = "oj-sttva-wopbamwpm6ttddpmzfwig"
  force_destroy = false
}

resource "aws_s3_bucket" "oj_transcripciones_genai" {
  bucket = "oj-transcripciones-genai-svuclmx8jabduiavugxeh"
  force_destroy = false
}

resource "aws_s3_bucket" "one_journey_back_as_ecr_g_deployment_1" {
  bucket = "one-journey-back-as-ecr-g-serverlessdeploymentbuck-dolibyjasqhp"

  tags = {
    STAGE = "genai"
  }
}
resource "aws_s3_bucket" "one_journey_back_as_ecr_g_deployment_2" {
  bucket = "one-journey-back-as-ecr-g-serverlessdeploymentbuck-rjl82uuxxofm"
tags = {
    STAGE = "genai-dev"
  }
}

resource "aws_s3_bucket" "one_journey_back_as_ecr_i_deployment" {
  bucket = "one-journey-back-as-ecr-i-serverlessdeploymentbuck-pnfckzyd5aah"
tags = {
    STAGE = "ia-dev"
  }
}

resource "aws_s3_bucket" "one_journey_back_as_ecs_g_deployment_1" {
  bucket = "one-journey-back-as-ecs-g-serverlessdeploymentbuck-cfnvdwfpbtsv"
tags = {
    STAGE = "genai-dev"
  }
}

resource "aws_s3_bucket" "one_journey_back_as_ecs_g_deployment_2" {
  bucket = "one-journey-back-as-ecs-g-serverlessdeploymentbuck-j9azhf22p0fv"
tags = {
    STAGE = "genai"
  }

}

resource "aws_s3_bucket" "one_journey_data_bucket_genai" {
  bucket = "one-journey-data-bucket-genai"

tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "one_journey_files_bucket_genai" {
  bucket = "one-journey-files-bucket-genai"
tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "one_journey_front_pipeline_artifacts" {
  bucket = "one-journey-front-pipeline-artifacts-971422687659"
}

resource "aws_s3_bucket" "one_journey_genai_deployment" {
  bucket = "one-journey-genai-serverlessdeploymentbucket-r8r10jddmxy6"
tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "one_journey_hosting_bucket_genai" {
  bucket = "one-journey-hosting-bucket-genai"
tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "one_journey_nodes_core_ge_deployment_1" {
  bucket = "one-journey-nodes-core-ge-serverlessdeploymentbuck-tezd9hxndj5i"
tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "one_journey_nodes_core_ge_deployment_2" {
  bucket = "one-journey-nodes-core-ge-serverlessdeploymentbuck-xa0dgmpjhd8h"
tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "one_journey_transcriptions_bucket_genai" {
  bucket = "one-journey-transcriptions-bucket-genai"
tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "one_journey_transcriptions_genai" {
  bucket = "one-journey-transcriptions-genai"
tags = {
    STAGE = "genai"
  }
}

resource "aws_s3_bucket" "onejourney_core_nodes_artifacts" {
  bucket = "onejourney-core-nodes-artifacts-971422687659-v2"
}

resource "aws_s3_bucket" "onejourney_genai_back_artifacts" {
  bucket = "onejourney-genai-back-artifacts-971422687659-v2"
}

resource "aws_s3_bucket" "onejourney_genai_back_cicd_artifacts" {
  bucket = "onejourney-genai-back-cicd-artifacts-971422687659-v2"

}

resource "aws_s3_bucket" "onejourney_genai_cicd_artifacts" {
  bucket = "onejourney-genai-cicd-artifacts-971422687659"
}

resource "aws_s3_bucket" "stt_transcripciones" {
  bucket = "stt-transcripciones"

}

resource "aws_s3_bucket" "stt_transcripciones_genai" {
  bucket = "stt-transcripciones-genai"

}

resource "aws_s3_bucket_versioning" "one_journey_data_bucket_genai_versioning" {
  bucket = aws_s3_bucket.one_journey_data_bucket_genai.id

  versioning_configuration {
    status = "Disabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "one_journey_data_bucket_genai_encryption" {
  bucket = aws_s3_bucket.one_journey_data_bucket_genai.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}