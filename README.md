# CloudflareADM

Ce projet a pour but d'industrialiser le déploiement et l'administration d'un compte Cloudflare via Terraform.

# Versions

* **Provider Cloudflare:** 5.0.0-alpha1

# API Token

Afin de pouvoir utiliser les différents modules, un ou plusieurs tokens doivent être créés depuis un compte disposant des droits d'administration sur la zone voulue.\
**\/\!\\ Une fois créé, le token d'API ne s'affiche qu'une seule fois. Conservez-le précieusement. \/\!\\**.

# Fonctionnement

Chaque fonctionnalité Cloudflare est prise en charge dans un dossier dédié.\
Chaque dossier de fonctionnalité possède l'arborescence suivante:\
* Un répertoire **modules** contenant le provider, les variables ainsi que les ressources inhérentes à la fonctionnalité Cloudflare concernée.
* Un répertoire pour chaque zone à administrer, chacun contenant un fichier **main.tf** ainsi qu'un ou plusieurs fichiers d'exemple à adapter.

# Stockage des state

Par défaut, ce projet stoque les fichiers state localement. A vous de prendre en charge la sécurité de ces derniers.\
Cependant, il est possible (préférable) de stocker vos fichiers state dans un S3 sur un compte commun ou dédié à votre projet.\
Bien que commenté par défaut, le bloc suivant dans le fichier **provider.tf** vous permet de paramétrer le stockage de vos fichiers state vers un S3:\
```
terraform {
  backend "s3" {
    bucket         = "bucket-name"
    region         = "region"
    dynamodb_table = "dynamodb-table-name"
    profile        = "AWS profile name"
    key            = "Name of the Terraform state file"
  }
}
```

# WAF Zone Rules

Ce module permet de créer une ruleset spécifique à une zone.\
**Vous trouverez ci-dessous la documentation Cloudflare associée:**
* Pour connaître la liste des actions disponibles: https://developers.cloudflare.com/ruleset-engine/rules-language/actions/
* Pour connaitre la liste des phases disponibles: https://developers.cloudflare.com/ruleset-engine/reference/phases-list/
* Pour connaître la syntaxe des expressions de règle WAF: https://developers.cloudflare.com/ruleset-engine/rules-language/

## Fonctionnalités:
1. Création, modification et suppression de règle.
2. Changement de l'ordre des règles.

## Mise en place

1. Dans le dossier **terraform/waf-rules/**, créez un répertoire par zone à administrer en dupliquant le dossier **terraform/waf-rules/zone-fqdn**.
2. En se servant du fichier **terraform/waf-rules/zone-fqdn/rules_sample**, composez les règles que vous souhaitez créer.
3. Jouer votre **terraform init** ainsi que votre **terraform apply** dans chaque dossier de zone afin de déployer votre configuration.

# Copyright

Romain QUADRELLI

