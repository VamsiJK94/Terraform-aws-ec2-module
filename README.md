# terraform-aws-ec2-instance

A Terraform module to create an Amazon Web Services (AWS) EC2 instance.

## Usage

```hcl
module "ec2_instance" {
  source = "path_to_your_module"

  name                     = "example-instance"
  ami                      = "ami-0c55b159cbfafe1f0"
  instance_type            = "t3.micro"
  cpu_core_count           = 2
  cpu_threads_per_core     = 2
  hibernation              = false
  availability_zone        = "us-west-2a"
  subnet_id                = "subnet-abcd"
  vpc_security_group_ids   = ["sg-0123456789abcd"]
  key_name                 = "my-key-pair"
  monitoring               = true
  get_password_data        = false
  iam_instance_profile     = "my-iam-profile"
  associate_public_ip_address = true
  private_ip               = "10.0.1.10"
  secondary_private_ips    = ["10.0.1.11"]
  ipv6_address_count       = 1
  ipv6_addresses           = ["2001:db8::1234"]
  ebs_optimized            = true
  ebs_kms_key              = "arn:aws:kms:us-west-2:123456789012:key/demo-key"
  ebs_block_device = {
    device_name           = "/dev/sdh"
    volume_size           = 50
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = true
    iops                  = 150
    throughput            = 125
  }
  tags = {
    Environment = "dev"
    Project     = "example"
  }
}
```

## Variables

- `name` - Name to be used on the EC2 instance created
- `tags` - A mapping of tags to assign to the resource
- `ami` - ID of AMI to use for the instance
- `instance_type` - The type of instance to start (default: t3.micro)
- `cpu_core_count` - Sets the number of CPU cores for an instance
- `cpu_threads_per_core` - Sets the number of CPU threads per core for an instance (has no effect unless cpu_core_count is also set)
- `hibernation` - If true, the launched EC2 instance will support hibernation
- `availability_zone` - AZ to start the instance in
- `subnet_id` - The VPC Subnet ID to launch in
- `vpc_security_group_ids` - A list of security group IDs to associate with
- `key_name` - Key name of the Key Pair to use for the instance; can be managed using the aws_key_pair resource
- `monitoring` - If true, the launched EC2 instance will have detailed monitoring enabled
- `get_password_data` - If true, wait for password data to become available and retrieve it
- `iam_instance_profile` - IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile
- `associate_public_ip_address` - Whether to associate a public IP address with an instance in a VPC
- `private_ip` - Private IP address to associate with the instance in a VPC
- `secondary_private_ips` - A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC
- `ipv6_address_count` - A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet
- `ipv6_addresses` - Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface
- `ebs_optimized` - If true, the launched EC2 instance will be EBS-optimized
- `ebs_kms_key` - KMS Key id for encrypting EBS volumes
- `ebs_block_device` - Additional EBS block devices to attach to the instance
- `Outputs
- `ec2_id` - The ID of the instance
- `arn` - The ARN of the instance
- `ec2_private_ip` - The private IP address assigned to the instance

## Outputs

- `ec2_id` - The ID of the instance
- `arn` - The ARN of the instance
- `ec2_private_ip` - The private IP address assigned to the instance