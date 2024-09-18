resource "aws_route53_record" "expense" {
    count = length(var.instances_name)
    zone_id = var.hosted_id
    name    = "${var.instances_name[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.expense[count.index].private_ip]
}