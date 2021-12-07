# Terraform Kubernetes Elastic Cloud

## Introduction

This module deploys and configures Elastic Cloud inside a Kubernetes Cluster.

## Security Controls

The following security controls can be met through configuration of this template:

* TBD

## Dependencies

* None

## Optional (depending on options configured):

* None

## Usage

```terraform
module "kubectl_eck" {
  source = "github.com/canada-ca-terraform-modules/terraform-kubernetes-elastic-cloud?ref=v1.0.0"

  depends_on = [
    module.namespace_elastic_system,
  ]

  kubectl_namespace = module.namespace_elastic_system.name
}
```

## Variables Values

| Name              | Type | Required | Value                                                  |
| ----------------- | ---- | -------- | ------------------------------------------------------ |
| kubectl_namespace | list | yes      | The namespace kubectl will install the manifests under |

## History

| Date     | Release    | Change                                                        |
| -------- | ---------- | ------------------------------------------------------------- |
| 20190729 | 20190729.1 | Improvements to documentation and formatting                  |
| 20190909 | 20190909.1 | 1st release                                                   |
| 20200122 | v1.0.0     | Update Operator to 1.0.0 manifest                             |
| 20200606 | v1.0.1     | Update Operator to 1.1.2 manifest                             |
| 20200729 | v1.0.2     | Update Operator to 1.2.0 manifest                             |
| 20201110 | v1.0.3     | Update Operator to 1.2.1 manifest                             |
| 20210825 | v2.0.0     | Update module for Terraform 0.13 and remove uneeded variables |
| 20211207 | v2.1.0     | Update Operator to 1.8.0 manifest                             |
