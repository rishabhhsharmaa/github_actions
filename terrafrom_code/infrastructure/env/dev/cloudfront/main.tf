module cloudfront {
source  = "../../../modules/cloudfront/"    
comment                  = "AWS Cloudfront Module"
webacl = <WAF_ACL_ID>
target_origin_id = <assign target_origin_id for default cache>
s3_origin_config = [
  {
    domain_name            = "domain.s3.amazonaws.com"
    origin_id              = "S3-domain-cert"
    origin_access_identity = "origin-access-identity/cloudfront/1234"
  }
]
custom_origin_config = [
  {
    domain_name              = "sample.com"
    origin_id                = "sample"
    origin_path              = ""
    http_port                = 80
    https_port               = 443
    origin_keepalive_timeout = 5
    origin_read_timeout      = 30
    origin_protocol_policy   = "https-only"
    origin_ssl_protocols     = ["TLSv1.2", "TLSv1.1"]
  }
]
ordered_cache_behavior = [
  {
    path_pattern           = "/sample/"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "sample.com"
    compress               = false
    query_string           = true
    cookies_forward        = "all"
    headers                = []
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }
]
custom_error_response = [
  {
    error_caching_min_ttl = 1
    error_code            = 404
    response_code         = 200
    response_page_path    = "/error/200.html"
  }
]
}