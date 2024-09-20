resource "cloudflare_workers_script" "rev_proxy" {
  account_id = var.cloudflare_acc_id
  name       = "rev_proxy_script"
  content    = file("./worker.js")
}

resource "cloudflare_zone" "zone" {
  account_id = var.cloudflare_acc_id
  zone       = aws_cloudfront_distribution.cloudfront_dist.domain_name
}

resource "cloudflare_workers_route" "worker_route" {
  zone_id = cloudflare_zone.zone.id
  pattern = "*.${aws_cloudfront_distribution.cloudfront_dist.domain_name}/*"
}