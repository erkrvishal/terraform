output "instance_id" {
  value = aws_instance.demo_instance.id
}

output "public_ip" {
  value = aws_instance.demo_instance.public_ip
}

output "bucket_name" {
    value = aws_s3_bucket.demo_bucket.id
}

output "bucket_arn" {
    value = aws_s3_bucket.demo_bucket.arn
}