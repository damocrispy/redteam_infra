This is me trying to follow a tutorial. [It's this tutorial here.](https://medium.com/@jacobdiamond/command-control-infrastructure-using-aws-cloudflare-and-mythic-part-1-d9b02354f7b2) The thing is that the tutorial does a lot of clicking with the mouse in a browser and I'm all, like, IaC these days, so I terraformed all the infra for it. I learned a bit. Planning on learning a bit more. Kind of the whole point. It's not exactly the same as the tutorial, but sure like whatever.

WORK IN PROGRESS.


<details>
<summary>Current `terraform plan`:</summary>

```
Terraform will perform the following actions:

  # aws_cloudfront_distribution.cloudfront_dist will be created
  + resource "aws_cloudfront_distribution" "cloudfront_dist" {
      + arn                             = (known after apply)
      + caller_reference                = (known after apply)
      + continuous_deployment_policy_id = (known after apply)
      + domain_name                     = (known after apply)
      + enabled                         = true
      + etag                            = (known after apply)
      + hosted_zone_id                  = (known after apply)
      + http_version                    = "http2"
      + id                              = (known after apply)
      + in_progress_validation_batches  = (known after apply)
      + is_ipv6_enabled                 = false
      + last_modified_time              = (known after apply)
      + price_class                     = "PriceClass_All"
      + retain_on_delete                = false
      + staging                         = false
      + status                          = (known after apply)
      + tags_all                        = (known after apply)
      + trusted_key_groups              = (known after apply)
      + trusted_signers                 = (known after apply)
      + wait_for_deployment             = true

      + default_cache_behavior {
          + allowed_methods        = [
              + "DELETE",
              + "GET",
              + "HEAD",
              + "OPTIONS",
              + "PATCH",
              + "POST",
              + "PUT",
            ]
          + cached_methods         = [
              + "GET",
              + "HEAD",
            ]
          + compress               = true
          + default_ttl            = 3600
          + max_ttl                = 86400
          + min_ttl                = 0
          + target_origin_id       = (known after apply)
          + trusted_key_groups     = (known after apply)
          + trusted_signers        = (known after apply)
          + viewer_protocol_policy = "allow-all"

          + forwarded_values {
              + headers                 = (known after apply)
              + query_string            = false
              + query_string_cache_keys = (known after apply)

              + cookies {
                  + forward           = "none"
                  + whitelisted_names = (known after apply)
                }
            }
        }

      + ordered_cache_behavior {
          + allowed_methods        = [
              + "GET",
              + "HEAD",
              + "OPTIONS",
            ]
          + cached_methods         = [
              + "GET",
              + "HEAD",
              + "OPTIONS",
            ]
          + compress               = true
          + default_ttl            = 3600
          + max_ttl                = 86400
          + min_ttl                = 0
          + path_pattern           = "*"
          + target_origin_id       = (known after apply)
          + viewer_protocol_policy = "redirect-to-https"

          + forwarded_values {
              + headers                 = (known after apply)
              + query_string            = false
              + query_string_cache_keys = (known after apply)

              + cookies {
                  + forward = "none"
                }
            }
        }

      + origin {
          + connection_attempts      = 3
          + connection_timeout       = 10
          + domain_name              = (known after apply)
          + origin_id                = (known after apply)
            # (2 unchanged attributes hidden)

          + custom_origin_config {
              + http_port                = 80
              + https_port               = 443
              + origin_keepalive_timeout = 5
              + origin_protocol_policy   = "http-only"
              + origin_read_timeout      = 30
              + origin_ssl_protocols     = [
                  + "TLSv1.2",
                ]
            }
        }

      + restrictions {
          + geo_restriction {
              + locations        = [
                  + "DE",
                  + "GB",
                  + "IE",
                  + "US",
                ]
              + restriction_type = "whitelist"
            }
        }

      + viewer_certificate {
          + cloudfront_default_certificate = true
          + minimum_protocol_version       = "TLSv1"
        }
    }

  # aws_default_subnet.default_subnet_a will be created
  + resource "aws_default_subnet" "default_subnet_a" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = (known after apply)
      + enable_dns64                                   = false
      + enable_lni_at_device_index                     = (known after apply)
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + existing_default_subnet                        = (known after apply)
      + force_destroy                                  = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + outpost_arn                                    = (known after apply)
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags_all                                       = (known after apply)
      + vpc_id                                         = (known after apply)
    }

  # aws_default_subnet.default_subnet_b will be created
  + resource "aws_default_subnet" "default_subnet_b" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = (known after apply)
      + enable_dns64                                   = false
      + enable_lni_at_device_index                     = (known after apply)
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + existing_default_subnet                        = (known after apply)
      + force_destroy                                  = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + outpost_arn                                    = (known after apply)
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags_all                                       = (known after apply)
      + vpc_id                                         = (known after apply)
    }

  # aws_default_subnet.default_subnet_c will be created
  + resource "aws_default_subnet" "default_subnet_c" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "eu-west-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = (known after apply)
      + enable_dns64                                   = false
      + enable_lni_at_device_index                     = (known after apply)
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + existing_default_subnet                        = (known after apply)
      + force_destroy                                  = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + outpost_arn                                    = (known after apply)
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags_all                                       = (known after apply)
      + vpc_id                                         = (known after apply)
    }

  # aws_default_vpc.default_vpc will be created
  + resource "aws_default_vpc" "default_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = (known after apply)
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + existing_default_vpc                 = (known after apply)
      + force_destroy                        = false
      + id                                   = (known after apply)
      + instance_tenancy                     = (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "Default VPC"
        }
      + tags_all                             = {
          + "Name" = "Default VPC"
        }
    }

  # aws_iam_instance_profile.vm_iam_profile will be created
  + resource "aws_iam_instance_profile" "vm_iam_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "vm_profile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "vm_role"
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_role.vm_iam_role will be created
  + resource "aws_iam_role" "vm_iam_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = {
                  + Action    = "sts:AssumeRole"
                  + Effect    = "Allow"
                  + Principal = {
                      + Service = "ec2.amazonaws.com"
                    }
                }
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "vm_role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "stack" = "test"
        }
      + tags_all              = {
          + "stack" = "test"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role_policy_attachment.ssm_policy will be created
  + resource "aws_iam_role_policy_attachment" "ssm_policy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      + role       = "vm_role"
    }

  # aws_instance.ec2_vm will be created
  + resource "aws_instance" "ec2_vm" {
      + ami                                  = "ami-041290b7cc4be2d3c"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "vm_profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "redteam_main"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "Main"
        }
      + tags_all                             = {
          + "Name" = "Main"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "6cc1787518edc4375236a53e076b90bc855ab409"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_key_pair.redteam_keys will be created
  + resource "aws_key_pair" "redteam_keys" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "redteam_main"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = (sensitive value)
      + tags_all        = (known after apply)
    }

  # aws_lb.load_balancer will be created
  + resource "aws_lb" "load_balancer" {
      + arn                                                          = (known after apply)
      + arn_suffix                                                   = (known after apply)
      + client_keep_alive                                            = 3600
      + desync_mitigation_mode                                       = "defensive"
      + dns_name                                                     = (known after apply)
      + drop_invalid_header_fields                                   = false
      + enable_deletion_protection                                   = false
      + enable_http2                                                 = true
      + enable_tls_version_and_cipher_suite_headers                  = false
      + enable_waf_fail_open                                         = false
      + enable_xff_client_port                                       = false
      + enforce_security_group_inbound_rules_on_private_link_traffic = (known after apply)
      + id                                                           = (known after apply)
      + idle_timeout                                                 = 60
      + internal                                                     = (known after apply)
      + ip_address_type                                              = (known after apply)
      + load_balancer_type                                           = "application"
      + name                                                         = "my-load-balancer"
      + name_prefix                                                  = (known after apply)
      + preserve_host_header                                         = false
      + security_groups                                              = (known after apply)
      + subnets                                                      = (known after apply)
      + tags_all                                                     = (known after apply)
      + vpc_id                                                       = (known after apply)
      + xff_header_processing_mode                                   = "append"
      + zone_id                                                      = (known after apply)

      + subnet_mapping (known after apply)
    }

  # aws_lb_listener.listener will be created
  + resource "aws_lb_listener" "listener" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 80
      + protocol          = "HTTP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }

      + mutual_authentication (known after apply)
    }

  # aws_lb_target_group.target_group will be created
  + resource "aws_lb_target_group" "target_group" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = (known after apply)
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancer_arns                 = (known after apply)
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_anomaly_mitigation  = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = "my-target-group"
      + name_prefix                        = (known after apply)
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags_all                           = (known after apply)
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = (known after apply)
          + path                = "/health"
          + port                = "80"
          + protocol            = "HTTP"
          + timeout             = (known after apply)
          + unhealthy_threshold = 3
        }

      + stickiness (known after apply)

      + target_failover (known after apply)

      + target_group_health (known after apply)

      + target_health_state (known after apply)
    }

  # aws_lb_target_group_attachment.target_attachment will be created
  + resource "aws_lb_target_group_attachment" "target_attachment" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_security_group.app_sg will be created
  + resource "aws_security_group" "app_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "86.44.146.103/32",
                ]
              + description      = "SSH ingress"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = []
              + description      = "Ingress from LB"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "app_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.lb_sg will be created
  + resource "aws_security_group" "lb_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Ingress from everywhere"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "lb_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_wafv2_web_acl.waf_acl will be created
  + resource "aws_wafv2_web_acl" "waf_acl" {
      + application_integration_url = (known after apply)
      + arn                         = (known after apply)
      + capacity                    = (known after apply)
      + id                          = (known after apply)
      + lock_token                  = (known after apply)
      + name                        = "waf-acl"
      + scope                       = "CLOUDFRONT"
      + tags_all                    = (known after apply)

      + default_action {
          + allow {
            }
        }

      + rule {
          + name     = "rule-1"
          + priority = 1

          + action {
              + block {
                }
            }

          + statement {
              + rate_based_statement {
                  + aggregate_key_type    = "IP"
                  + evaluation_window_sec = 300
                  + limit                 = 100
                }
            }

          + visibility_config {
              + cloudwatch_metrics_enabled = false
              + metric_name                = "friendly-rule-metric-name"
              + sampled_requests_enabled   = false
            }
        }

      + visibility_config {
          + cloudwatch_metrics_enabled = false
          + metric_name                = "friendly-metric-name"
          + sampled_requests_enabled   = false
        }
    }

Plan: 17 to add, 0 to change, 0 to destroy.
```
</details>