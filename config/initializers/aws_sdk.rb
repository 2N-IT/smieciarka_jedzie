# frozen_string_literal: true

require 'aws-sdk-core'

Aws.config.update(
  region: 'eu-central-1',
  credentials: Aws::Credentials.new(Rails.application.credentials.aws[:access_key_id],
                                    Rails.application.credentials.aws[:secret_access_key])
)
