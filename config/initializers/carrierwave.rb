CarrierWave.configure  do |config|

  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAI6TVUTELZPJNRUSQ',                        # required
    aws_secret_access_key: '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',# required
    region:                'sa-east-1'
  }
  config.fog_directory  = '9space'                # required
end
