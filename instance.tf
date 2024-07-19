resource "aws_instance" "this" {
  ami                  = var.ami
  instance_type        = var.instance_type
  cpu_core_count       = var.cpu_core_count
  cpu_threads_per_core = var.cpu_threads_per_core
  hibernation          = var.hibernation

  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  key_name             = var.key_name
  monitoring           = var.monitoring
  get_password_data    = var.get_password_data
  iam_instance_profile = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address
  private_ip                  = var.private_ip
  secondary_private_ips       = var.secondary_private_ips
  ipv6_address_count          = var.ipv6_address_count
  ipv6_addresses              = var.ipv6_addresses

  ebs_optimized = var.ebs_optimized
  
  #Configuration block to customize details about the root block device of the instance.
  root_block_device {
    volume_size           = try(var.root_block_device.volume_size, null)
    volume_type           = try(var.root_block_device.volume_type, null)
    delete_on_termination = try(var.root_block_device.delete_on_termination, false)
    encrypted             = try(var.root_block_device.encrypted, false)
    kms_key_id            = try(var.ebs_kms_key, null)
    iops                  = try(var.root_block_device.iops, null)
    throughput            = try(var.root_block_device.throughput, null)
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      device_name           = ebs_block_device.value.device_name
      volume_size           = try(ebs_block_device.value.volume_size, null)
      volume_type           = try(ebs_block_device.value.volume_type, null)
      delete_on_termination = try(ebs_block_device.value.delete_on_termination, false)
      encrypted             = try(ebs_block_device.value.encrypted, false)
      kms_key_id            = try(var.ebs_kms_key, null)
      iops                  = try(ebs_block_device.value.iops, null)
      throughput            = try(ebs_block_device.value.throughput, null)
    }
  }

  volume_tags = merge({ "Name" = "${var.name}-Disk" }, var.tags)
  tags = merge({ "Name" = var.name }, var.tags)
}