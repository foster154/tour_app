AWS.config(
	access_key_id: 		ENV["AWS_ACCESS_KEY_ID"],
	secret_access_key:  ENV["AWS_SECRET_ACCESS_KEY"],
	bucket:             ENV["S3_BUCKET_NAME"]
)



#AWS.config(
#  access_key_id:      Rails.application.secrets.aws['access_key_id'],
#  secret_access_key:  Rails.application.secrets.aws['secret_access_key'],
#  bucket:             Rails.application.secrets.aws['s3_bucket_name']
#)
