output "security_group_ids"
{
  description = "List of security groups"
  value = [
    for key, instance in aws_security_group.main : {
      name       = key
      name = instance.name
      id  = instance.id
    }
  ]
}
