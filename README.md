# CloudflareADM

Ce projet a pour but d'industrialiser le déploiement et l'administration d'un compte Cloudflare via Terraform.

# Versions

* **Provider Cloudflare:** 5.0.0-alpha1

## API Token

Doc sur la création d'un token d'API avec les bons droits.

## Fonctionnalités
### WAF Rules
* Pour connaître la liste des actions disponibles: https://developers.cloudflare.com/ruleset-engine/rules-language/actions/
* Pour connaitre la liste des phases disponibles: https://developers.cloudflare.com/ruleset-engine/reference/phases-list/
* Pour connaître la syntaxe des expression de règle WAF: https://developers.cloudflare.com/ruleset-engine/rules-language/

#### Tests effectués:
1. Ajout d'une ou plusieurs règles.
2. Modification d'une ou plusieurs règles.
3. Suppression d'une ou plusieurs règles.
4. Changement de l'ordre des règles.
