provider "aws" {
  # 사용할 리전
  region = "ap-northeast-2"
  # iam권한을 acceess할 수 있는 정보
  shared_credentials_files = ["/Users/dio/.aws/credentials"]
  # profile 이름 
  profile = "eb"
}