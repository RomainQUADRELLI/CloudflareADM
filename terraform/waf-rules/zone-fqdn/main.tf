module "waf-custom-rules" {
    source = "../modules"

    cloudflare_zone_id = "ZONE ID OF THE ZONE YOU WANT TO EDIT"
    cloudflare_api_token = "API TOKEN OF ALLOWED USER"

    zone-fqdn_rules = []
}
