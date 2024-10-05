provider "aws" {
  region = "ap-northeast-2"
}

# VPC 생성
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  for_each          = toset(var.public_subnet_cidr) 
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value
  availability_zone = element(["ap-northeast-2a", "ap-northeast-2b"], index(var.public_subnet_cidr, each.value))  # 가용 영역 설정

  tags = {
    Name = "${var.env}-public-subnet-${index(var.public_subnet_cidr, each.value)}"
    Type = "Public"
  }
}


# 프라이빗 서브넷 1
resource "aws_subnet" "private_subnet_1" {
  for_each          = toset(var.private_subnet_1_cidr) 
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value
  availability_zone = element(["ap-northeast-2a", "ap-northeast-2b"], index(var.private_subnet_1_cidr, each.value))  # 가용 영역 설정

  tags = {
    Name = "${var.env}-private-subnet-1-${index(var.private_subnet_1_cidr, each.value)}"
  }
}

# 프라이빗 서브넷 2
resource "aws_subnet" "private_subnet_2" {
  for_each          = toset(var.private_subnet_2_cidr) 
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value
  availability_zone = element(["ap-northeast-2a", "ap-northeast-2b"], index(var.private_subnet_2_cidr, each.value))  # 가용 영역 설정

  tags = {
    Name = "${var.env}-private-subnet-2-${index(var.private_subnet_2_cidr, each.value)}"
  }
}

# 프라이빗 서브넷 3
resource "aws_subnet" "private_subnet_3" {
  for_each          = toset(var.private_subnet_3_cidr) 
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value
  availability_zone = element(["ap-northeast-2a", "ap-northeast-2b"], index(var.private_subnet_3_cidr, each.value))  # 가용 영역 설정

  tags = {
    Name = "${var.env}-private-subnet-3-${index(var.private_subnet_3_cidr, each.value)}"
  }
}

# variables.tf 파일에서 변수들을 선언합니다.
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_1_cidr" {}
variable "private_subnet_2_cidr" {}
variable "private_subnet_3_cidr" {}
variable "env" {}