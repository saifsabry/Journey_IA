locals {
  # Common environment variables for most one-journey functions
  common_env_vars = {
    REGION                                      = "eu-west-1"
    STAGE                                       = "genai"
    ACCOUNT_ID                                  = "971422687659"
    API_ENDPOINT                                = "https://d5tcv80br4.execute-api.eu-west-1.amazonaws.com/genai/"
    CDN_ENDPOINT                                = "https://d7cnvwmb0wtsp.cloudfront.net/"
    CORS_ORIGIN                                 = "*"
    DEBUG_LOG                                   = "/aws/one-journey/one-journey-DebugLogs"
    ERROR_LOG                                   = "/aws/one-journey/one-journey-ErrorLogs"
    DOMAIN_SUFFIX                               = "one-journey"
    DYNAMODB_TABLE_CHANNEL_MESSAGES             = "one-journey-channel-messages"
    DYNAMODB_TABLE_COMMON_OBJECTS               = "one-journey-common-objects"
    DYNAMODB_TABLE_COST                         = "one-journey-cost"
    DYNAMODB_TABLE_COUNTERS_STORAGE_CHANNEL     = "one-journey-counters-storage-channel"
    DYNAMODB_TABLE_EXECUTIONS_V5                = "one-journey-executions-v5"
    DYNAMODB_TABLE_EXECUTIONS_V5_DETAIL         = "one-journey-executions-v5-detail"
    DYNAMODB_TABLE_EXECUTIONS_V5_GSI_CREATED_AT = "one-journey-executions-v5-gsi-createdAt"
    DYNAMODB_TABLE_EXECUTIONS_V5_GSI_UPDATED_AT = "one-journey-executions-v5-gsi-updatedAt"
    DYNAMODB_TABLE_MUTEX_LOCK                   = "one-journey-mutex-lock"
    DYNAMODB_TABLE_SESSIONS                     = "one-journey-sessions"
    DYNAMODB_TABLE_STT_OPERATIONS               = "one-journey-sttOperations"
    DYNAMODB_TABLE_WEBSOCKETS_MANAGER           = "one-journey-websockets-manager"
    DYNAMODB_TABLE_WORKFLOWS_BACKUP             = "one-journey-workflows-backup"
    DYNAMODB_TABLE_WORKFLOW_CONTEXT             = "one-journey-workflow-context"
    EVENTBRIDGE_MESSAGE_BUS                     = "one-journey-messages-bus-genai"
    HOSTING_BUCKET                              = "one-journey-hosting-bucket-genai"
    MAIN_CONFIGURATION_ID                       = "@MAIN_CONFIGURATION"
    MAX_CHATGPT_RETRY_REQUEST                   = "5"
    ONE_JOURNEY_DATA_BUCKET                     = "one-journey-data-bucket-genai"
    ONE_JOURNEY_FILES_BUCKET                    = "one-journey-files-bucket-genai"
    TRANSCRIPTIONS_BUCKET                       = "one-journey-transcriptions-genai"
    USER_POOL_ID                                = "eu-west-1_M21ToRrBa"
    VERSION                                     = "v1"
    WEBSOCKET_API_ENDPOINT                      = "wss://mu5nzg1mp2.execute-api.eu-west-1.amazonaws.com/genai/"
    DYNAMODB_TABLE_EXECUTIONS                   = "one-journey-executions"
    CORE_S3_EVENT_ARN                           = "arn:aws:lambda:eu-west-1:971422687659:function:one-journey-genai-coreS3Event"
    STORAGE_PROCESS_LAMBDA_ARN                  = "arn:aws:lambda:eu-west-1:971422687659:function:one-journey-genai-manageFileStorage"
    STT_WEBHOOK_ARN                             = "arn:aws:lambda:eu-west-1:971422687659:function:one-journey-genai-sttWebhook"
    CORE_GDS_EVENT_ARN                          = "arn:aws:lambda:eu-west-1:971422687659:function:one-journey-genai-coreGDSEvent"
    COGNITO_USER_POOL                           = "eu-west-1_M21ToRrBa"
    PROCESS_TRANSCRIPTION_ARN                   = "arn:aws:lambda:eu-west-1:971422687659:function:one-journey-genai-processTranscription"
    SQS_BATCH_QUEUE_URL                         = "https://sqs.eu-west-1.amazonaws.com/971422687659/one-journey-batch-queue-genai"
    AUDIOS_BUCKET                               = "one-journey-audiorecord-genai"
    KEYS_URL                                    = "https://cognito-idp.eu-west-1.amazonaws.com/eu-west-1_M21ToRrBa/.well-known/jwks.json"
    DYNAMODB_TABLE_SUSCRIPTIONS                 = "one-journey-suscriptions"
    KENDRA_S3_ROLE_ARN                          = "arn:aws:iam::971422687659:role/OneJourneyKendraS3Role"
    COGNITO_USER_POOL_CLIENT                    = "2tonlc0fcbruoestl0c4fuj8ts"
    USER_POOL_CLIENT_ID                         = "2tonlc0fcbruoestl0c4fuj8ts"
  }

  lambda_functions = {
    cron_lambda = {
      function_name = "one-journey-genai-cronLambda"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-cronLambda-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/cronJob/function.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    call_workflow_async = {
      function_name = "one-journey-nodes-core-genai-callWorkflowAsyncNode"
      role          = "arn:aws:iam::971422687659:role/OjcallWorkflowAsyncNodeRole"
      handler       = "./src/api/v1/node/callWorkflowAsync/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = null
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
        environment_variables = {
        REGION                                      = "eu-west-1"
        STAGE                                       = "genai"
        ACCOUNT_ID                                  = "971422687659"
        API_ENDPOINT                                = "https://d5tcv80br4.execute-api.eu-west-1.amazonaws.com/genai/"
        CDN_ENDPOINT                                = "https://d7cnvwmb0wtsp.cloudfront.net/"
        CORS_ORIGIN                                 = "*"
        DEBUG_LOG                                   = "/aws/one-journey/one-journey-nodes-core-DebugLogs"
        ERROR_LOG                                   = "/aws/one-journey/one-journey-nodes-core-ErrorLogs"
        DOMAIN_SUFFIX                               = "one-journey"
        DYNAMODB_TABLE_CHANNEL_MESSAGES             = "one-journey-channel-messages"
        DYNAMODB_TABLE_COMMON_OBJECTS               = "one-journey-common-objects"
        DYNAMODB_TABLE_COST                         = "one-journey-cost"
        DYNAMODB_TABLE_COUNTERS_STORAGE_CHANNEL     = "one-journey-counters-storage-channel"
        DYNAMODB_TABLE_EXECUTIONS_V5                = "one-journey-executions-v5"
        DYNAMODB_TABLE_EXECUTIONS_V5_DETAIL         = "one-journey-executions-v5-detail"
        DYNAMODB_TABLE_EXECUTIONS_V5_GSI_CREATED_AT = "one-journey-executions-v5-gsi-createdAt"
        DYNAMODB_TABLE_EXECUTIONS_V5_GSI_UPDATED_AT = "one-journey-executions-v5-gsi-updatedAt"
        DYNAMODB_TABLE_MUTEX_LOCK                   = "one-journey-mutex-lock"
        DYNAMODB_TABLE_SESSIONS                     = "one-journey-sessions"
        DYNAMODB_TABLE_STT_OPERATIONS               = "one-journey-sttOperations"
        DYNAMODB_TABLE_WEBSOCKETS_MANAGER           = "one-journey-websockets-manager"
        DYNAMODB_TABLE_WORKFLOWS_BACKUP             = "one-journey-workflows-backup"
        DYNAMODB_TABLE_WORKFLOW_CONTEXT             = "one-journey-workflow-context"
        EVENTBRIDGE_MESSAGE_BUS                     = "one-journey-messages-bus-genai"
        HOSTING_BUCKET                              = "one-journey-hosting-bucket-genai"
        MAIN_CONFIGURATION_ID                       = "@MAIN_CONFIGURATION"
        MAX_CHATGPT_RETRY_REQUEST                   = "5"
        ONE_JOURNEY_DATA_BUCKET                     = "one-journey-data-bucket-genai"
        ONE_JOURNEY_FILES_BUCKET                    = "one-journey-files-bucket-genai"
        TRANSCRIPTIONS_BUCKET                       = "one-journey-transcriptions-genai"
        USER_POOL_ID                                = "eu-west-1_M21ToRrBa"
        VERSION                                     = "v1"
        WEBSOCKET_API_ENDPOINT                      = "wss://mu5nzg1mp2.execute-api.eu-west-1.amazonaws.com/genai/"
      }
      tags = { STAGE = "genai" }
    }

    controltower_notification_forwarder = {
      function_name = "aws-controltower-NotificationForwarder"
      role          = "arn:aws:iam::971422687659:role/aws-controltower-ForwardSnsNotificationRole"
      handler       = "index.lambda_handler"
      runtime       = "python3.13"
      memory_size   = 128
      timeout       = 60
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = "SNS message forwarding function for aggregating account notifications."
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = {
        sns_arn = "arn:aws:sns:eu-west-1:603321434203:aws-controltower-AggregateSecurityNotifications"
      }
      tags = {}
    }

    channel_restore_node = {
      function_name = "one-journey-genai-channelRestoreNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-channelRestoreNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/channelRestore/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    core_heap_node = {
      function_name = "one-journey-genai-coreHeapNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-coreHeapNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/heap/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    channel_switch_node = {
      function_name = "one-journey-genai-channelSwitchNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-channelSwitchNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/channelSwitch/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    kcrm_enqueue_voice_node = {
      function_name = "one-journey-genai-kcrmEnqueueVoiceNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-kcrmEnqueueVoiceNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/kcrm/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    telegram_webhook = {
      function_name = "one-journey-genai-telegramWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-telegramWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/telegram/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 30
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    core_set_choice_node = {
      function_name = "one-journey-genai-coreSetChoiceNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-coreSetChoiceNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/choice/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    stt_webhook_node = {
      function_name = "one-journey-genai-sttWebhookNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-sttWebhookNode-eu-west-1-lambdaRole"
      handler       = "src/api/v1/node/speechToText/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    rule_choice_node = {
      function_name = "one-journey-genai-ruleChoiceNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-ruleChoiceNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/ruleChoice/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    email_node = {
      function_name = "one-journey-genai-emailNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-emailNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/email/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 60
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    manage_file_storage = {
      function_name = "one-journey-genai-manageFileStorage"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-manageFileStorage-eu-west-1-lambdaRole"
      handler       = "src/api/v1/node/manageFileStorage/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 512
      timeout       = 300
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    google_drive_webhook = {
      function_name = "one-journey-genai-googleDriveWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-googleDriveWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/google-drive/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    option_gateway = {
      function_name = "one-journey-genai-optionGateway"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-optionGateway-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/option/gateway.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    message_handler = {
      function_name = "one-journey-genai-messageHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-messageHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/websocket.messageHandler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    call_workflow_node = {
      function_name = "one-journey-genai-callWorkflowNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-callWorkflowNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/callWorkflow/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    core_gds_event = {
      function_name = "one-journey-genai-coreGDSEvent"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-coreGDSEvent-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/gds/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    pipeline_notification_node = {
      function_name = "one-journey-genai-pipeLineNotificationNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-pipeLineNotificationNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/pipeLineNotification/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 60
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    gds_webhook = {
      function_name = "one-journey-genai-gdsWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-gdsWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/gds/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    echo_whatsapp_node = {
      function_name = "one-journey-genai-echoWhatsappNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-echoWhatsappNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/echoWhatsapp/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    google_calendar_webhook = {
      function_name = "one-journey-genai-googleCalendarWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-googleCalendarWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/google-calendar/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    change_state = {
      function_name = "one-journey-genai-changeState"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-changeState-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/user/changeStatus.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    variable_node = {
      function_name = "one-journey-genai-variableNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-variableNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/variable/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 60
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    request_node = {
      function_name = "one-journey-genai-requestNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-requestNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/request/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 60
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    disconnect_handler = {
      function_name = "one-journey-genai-disconnectHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-disconnectHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/websocket.disconnectHandler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    customize_id_token = {
      function_name = "one-journey-genai-customizeIDToken"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-customizeIDToken-eu-west-1-lambdaRole"
      handler       = "src/cognito/customizeIDToken.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    mass_creation = {
      function_name = "one-journey-genai-massCreation"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-massCreation-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/user/massCreation.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    error_catch_all = {
      function_name = "one-journey-genai-errorCatchAll"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-errorCatchAll-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/catchAll/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    vonage_voice_webhook = {
      function_name = "one-journey-genai-vonageVoiceWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-vonageVoiceWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/vonage-voice/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    session_end = {
      function_name = "one-journey-genai-sessionEnd"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-sessionEnd-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/session/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    execution_context = {
      function_name = "one-journey-genai-executionContext"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-executionContext-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/execution/context.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    process_transcription_node = {
      function_name = "one-journey-genai-processTranscriptionNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-processTranscriptionNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/processTranscription/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    pipeline_response = {
      function_name = "one-journey-genai-pipelineResponse"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-pipelineResponse-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/pipelineResponse/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 60
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    reset_pswrd = {
      function_name = "one-journey-genai-resetPswrd"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-resetPswrd-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/user/resetPswrd.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    auth_handler = {
      function_name = "one-journey-genai-authHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-authHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/websocketAuth.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    telegram_webhook_bcg = {
      function_name = "one-journey-genai-telegramWebhookBCG"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-telegramWebhookBCG-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/telegram-bcg/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 30
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    channel_hub_webhook = {
      function_name = "one-journey-genai-channelHubWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-channelHubWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/channel-hub/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    core_s3_event = {
      function_name = "one-journey-genai-coreS3Event"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-coreS3Event-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/s3/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    connect_handler = {
      function_name = "one-journey-genai-connectHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-connectHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/websocket.connectHandler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    zendesk_webhook = {
      function_name = "one-journey-genai-zendeskWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-zendeskWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/zendesk/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    execution_patch = {
      function_name = "one-journey-genai-executionPatch"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-executionPatch-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/execution/patch.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    rule_gateway_node = {
      function_name = "one-journey-genai-ruleGatewayNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-ruleGatewayNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/ruleGateway/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    vonage_stream_webhook = {
      function_name = "one-journey-genai-vonageStreamWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-vonageStreamWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/vonage-stream/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    webform_webhook = {
      function_name = "one-journey-genai-webformWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-webformWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/webform/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    execution_event = {
      function_name = "one-journey-genai-executionEvent"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-executionEvent-eu-west-1-lambdaRole"
      handler       = "src/api/v1/core/execution/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    execution_continue = {
      function_name = "one-journey-genai-executionContinue"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-executionContinue-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/execution/continue.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    execution_stop = {
      function_name = "one-journey-genai-executionStop"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-executionStop-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/execution/stop.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    talkjs_webhook = {
      function_name = "one-journey-genai-talkJsWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-talkJsWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/talkJs/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    open_messaging_webhook = {
      function_name = "one-journey-genai-openMessagingWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-openMessagingWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/open-messaging/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    for_each_node = {
      function_name = "one-journey-genai-forEachNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-forEachNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/forEach/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    cognito_emails_customizer = {
      function_name = "one-journey-genai-cognitoEmailsCustomizer"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-eu-west-1-lambdaRole"
      handler       = "src/cognito/messages.endpoint"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = null
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    error = {
      function_name = "one-journey-genai-error"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-error-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/errors/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    execution_get = {
      function_name = "one-journey-genai-executionGet"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-executionGet-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/execution/get.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    zendesk_node = {
      function_name = "one-journey-genai-zendeskNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-zendeskNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/zendesk/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    webform_get = {
      function_name = "one-journey-genai-webformGet"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-webformGet-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/webform/get.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    genesys_close_chat_node = {
      function_name = "one-journey-genai-genesysCloseChatNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-genesysCloseChatNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/genesys/closeChat.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    step_function_delete = {
      function_name = "one-journey-genai-stepFunctionDelete"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-stepFunctionDelete-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/step-function/delete.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    pre_sign_up = {
      function_name = "one-journey-genai-preSignUp"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-eu-west-1-lambdaRole"
      handler       = "src/cognito/presigned.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = null
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    step_function_list = {
      function_name = "one-journey-genai-stepFunctionList"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-stepFunctionList-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/step-function/list.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    action_node = {
      function_name = "one-journey-genai-actionNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-actionNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/action/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 120
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4", "arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    genesys_enqueue_chat_node = {
      function_name = "one-journey-genai-genesysEnqueueChatNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-genesysEnqueueChatNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/genesys/enqueueChat.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    meta_node = {
      function_name = "one-journey-genai-metaNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-metaNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/meta/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 60
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    manage_queue_channel = {
      function_name = "one-journey-genai-manageQueueChannel"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-manageQueueChannel-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/queue/manage.handler"
      runtime       = "nodejs20.x"
      memory_size   = 512
      timeout       = 300
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    azure_communication_webhook = {
      function_name = "one-journey-genai-azureCommunicationWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-azureCommunicationWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/azure-communication/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    google_chat_webhook = {
      function_name = "one-journey-genai-googleChatWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-googleChatWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/google-chat/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11", "arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    costs = {
      function_name = "one-journey-genai-costs"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-costs-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/costs/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    hand_off_node = {
      function_name = "one-journey-genai-handOffNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-handOffNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/handOff/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    authorizer = {
      function_name = "one-journey-genai-authorizer"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-authorizer-eu-west-1-lambdaRole"
      handler       = "src/cognito/authorizer.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    tool_json_data_transform_node = {
      function_name = "one-journey-genai-toolJSONDataTransformNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-toolJSONDataTransformNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/jsonDataTransform/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    tool_json_data_injection_node = {
      function_name = "one-journey-genai-toolJSONDataInjectionNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-toolJSONDataInjectionNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/jsonDataInjection/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    default_handler = {
      function_name = "one-journey-genai-defaultHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-defaultHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/websocket.defaultHandler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    create_context_node = {
      function_name = "one-journey-genai-createContextNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-createContextNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/createContext/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    user_me = {
      function_name = "one-journey-genai-userMe"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-userMe-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/user/me.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    core_batch = {
      function_name = "one-journey-genai-coreBatch"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-coreBatch-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/batch/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 2048
      timeout       = 120
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    speech_to_text_node = {
      function_name = "one-journey-genai-speechToTextNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-speechToTextNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/speechToText/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 120
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16", "arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    signalwire_webhook = {
      function_name = "one-journey-genai-signalwireWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-signalwireWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/signalwire/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    whatsapp_webhook = {
      function_name = "one-journey-genai-whatsappWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-whatsappWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/whatsapp/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    vonage_streaming_handler = {
      function_name = "one-journey-genai-vonageStreaminggHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-vonageStreaminggHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/vonage-streaming/handler.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    entity_gateway = {
      function_name = "one-journey-genai-entityGateway"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-entityGateway-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/entity/gateway.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 30
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:googleStorage:11"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    debugs = {
      function_name = "one-journey-genai-debugs"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-debugs-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/debugs/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    execution_delete = {
      function_name = "one-journey-genai-executionDelete"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-executionDelete-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/execution/delete.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    generate_prompt_node = {
      function_name = "one-journey-genai-generatePromptNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-generatePromptNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/generatePrompt/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    publish_workflow_patch = {
      function_name = "one-journey-genai-publishWorkflowPatch"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-publishWorkflowPatch-eu-west-1-lambdaRole"
      handler       = "src/api/v1/endpoint/workflow/post.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 30
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    wapi_webhook = {
      function_name = "one-journey-genai-wapiWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-wapiWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/wapi/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    pipeline_node = {
      function_name = "one-journey-genai-pipelineNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-pipelineNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/pipeline/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 60
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    broadcast_handler = {
      function_name = "one-journey-genai-broadcastHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-broadcastHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/websocket.broadcastHandler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    core_warm = {
      function_name = "one-journey-genai-coreWarm"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-coreWarm-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/core/warm/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 512
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    transcribe_action_node = {
      function_name = "one-journey-genai-transcribeActionNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-transcribeActionNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/action/transcribeEvent.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 120
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:ffmpegv1:4", "arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    telnyx_stream_webhook = {
      function_name = "one-journey-genai-telnyxStreamWebhook"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-telnyxStreamWebhook-eu-west-1-lambdaRole"
      handler       = "src/api/v1/channel/telnyx-stream/webhook.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["x86_64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = ["arn:aws:lambda:eu-west-1:971422687659:layer:genAILibs:16"]
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    stop_workflow_node = {
      function_name = "one-journey-genai-stopWorkflowNode"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-stopWorkflowNode-eu-west-1-lambdaRole"
      handler       = "./src/api/v1/node/stopWorkflow/event.handler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }

    check_connections_handler = {
      function_name = "one-journey-genai-checkConnectionsHandler"
      role          = "arn:aws:iam::971422687659:role/one-journey-genai-checkConnectionsHandler-eu-west-1-lambdaRole"
      handler       = "src/api/v1/websocket.checkConnectionsHandler"
      runtime       = "nodejs20.x"
      memory_size   = 1536
      timeout       = 6
      architectures = ["arm64"]
      package_type  = "Zip"
      publish       = false
      description   = ""
      s3_bucket     = "dummy-bucket"
      s3_key        = "dummy.zip"
      layers        = []
      environment_variables = local.common_env_vars
      tags = { STAGE = "genai" }
    }
  }
}

# Resource definition
resource "aws_lambda_function" "this" {
  for_each = local.lambda_functions

  function_name = each.value.function_name
  role          = each.value.role
  handler       = each.value.handler
  runtime       = each.value.runtime
  timeout       = each.value.timeout
  memory_size   = each.value.memory_size
  package_type  = each.value.package_type
  architectures = each.value.architectures
  description   = try(each.value.description, null)
  publish       = each.value.publish

  s3_bucket = each.value.s3_bucket
  s3_key    = each.value.s3_key

  layers = each.value.layers

  environment {
    variables = each.value.environment_variables
  }

  tags = each.value.tags

  lifecycle {
    ignore_changes = [
      s3_bucket,
      s3_key,
      source_code_hash,
      filename,
      handler,
      runtime,
      timeout
    ]
  }
}