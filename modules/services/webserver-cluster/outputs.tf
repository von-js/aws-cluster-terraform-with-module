output "alb_dns_name" {
  value       = aws_lb.terraform.dns_name
  description = "The domain name of the load balancer"
}
