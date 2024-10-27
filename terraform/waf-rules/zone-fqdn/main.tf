module "waf-custom-rules" {
    source = "../modules"

    cloudflare_zone_id = "ZONE ID OF THE ZONE YOU WANT TO EDIT"
    cloudflare_api_token = "API TOKEN OF ALLOWED USER"

    zone-fqdn_rules = [{
        description = "WAF RULE N°1"
        action      = "managed_challenge"
        expression  = "(http.host eq \"quadrelli.fr\")"
        enabled     = true
    },
    {
        description = "WAF RULE N°2"
        action      = "js_challenge"
        expression  = "(http.request.uri strict wildcard r\"/test\" and http.cookie wildcard r\"cookietest\")"
        enabled     = true
    },
    {
        description = "WAF RULE N°3"
        action      = "challenge"
        expression  = "(http.host eq \"quadrelli.fr\")"
        enabled     = true
    },
    {
        description = "WAF RULE N°4"
        action      = "block"
        expression  = "(http.host eq \"quadrelli.fr\")"
        enabled     = true
    },
    {
        description = "WAF RULE N°5"
        action      = "skip"
        expression  = "(http.host eq \"quadrelli.fr\")"
        action_parameters = {
        ruleset     = "current" ### All remaining custom rules
        phases      = [
                "http_ratelimit", ### All rate limiting rules
                "http_request_firewall_managed", ### All remaining managed rules
                "http_request_sbfm", ### All Super BOT Fight Mode Rules
            ]
        products    = [
            "zoneLockdown", ### Zone Lockdown
            "uaBlock", ### User Agent Blocking
            "bic", ### Browser Integrity Check
            "hot", ### Hotlink Protection
            "securityLevel", ### Security Level
            "rateLimit", ### Rate Limiting (previous version)
            "waf" ### WAF managed rules (previous version)	
        ]
        }
        enabled     = true
    }]
}
