class HardWorker
  include Sidekiq::Worker

  def perform(key, path)
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket("bookwormfiles")
    obj = bucket.object(key)
    obj.upload_file(path)
  end
end
