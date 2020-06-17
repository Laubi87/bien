CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIWRC2MI6S2TU5SVA',                        # required unless using use_iam_profile
    aws_secret_access_key: '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',                        # required unless using use_iam_profile
  }
  config.fog_directory  = 'bien-review'                                      # required
end
