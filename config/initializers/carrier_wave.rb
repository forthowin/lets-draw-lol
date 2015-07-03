CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
    config.aws_acl = :public_read

    config.aws_credentials = {
      access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      region:            ENV.fetch('AWS_REGION') # Required
    }
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end

if Rails.env.test?
  ImageUploader

  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/public/spec/support/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/public/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end

