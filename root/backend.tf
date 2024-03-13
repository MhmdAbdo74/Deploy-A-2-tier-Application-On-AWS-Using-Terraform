terraform {
  backend "s3" {
    bucket         = "mybucketfortfstate"
    key            = "state/my-tf.tfstate"
    region =          "sa-east-1"
    dynamodb_table = "remote-backend22"
  }
}