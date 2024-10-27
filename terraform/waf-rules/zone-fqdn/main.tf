module "waf-custom-rules" {
    source = "../modules"
    
    cloudflare_zone_id = "ZONE ID"
}
