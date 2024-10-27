variable cloudflare_api_token {
    type = string
    default = "API TOKEN OF ALLOWED USER"
}
variable cloudflare_zone_id {
    type = string
    default = "ZONE ID OF THE ZONE YOU WANT TO EDIT"
}
variable zone-fqdn_rules {
    description = "Map of string describing rules included in ruleset."
}
