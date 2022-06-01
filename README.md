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
  source = "github.com/canada-ca-terraform-modules/terraform-kubernetes-elastic-cloud?ref=v2.3.0"

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


## Upgrade Notes

After installing ECK 1.7.0, and subsequent versions, on Kubernetes versions 1.16/1.17 using Helm or the YAML manifests, deploying Elasticsearch may fail with the following error:

```bash
error: SchemaError(co.elastic.k8s.elasticsearch.v1.Elasticsearch.spec.nodeSets.volumeClaimTemplates): array should have exactly one sub-item
```

This is due to a validation issue in `kubectl` that has been addressed in the Kubernetes API server as of versions 1.18.13, 1.19.5 and 1.20. To work around this issue patch the Elasticsearch CRD as follows:

```bash
kubectl patch crd elasticsearches.elasticsearch.k8s.elastic.co --type json -p='[{"op": "remove", "path": "/spec/versions/0/schema/openAPIV3Schema/properties/spec/properties/nodeSets/items/properties/volumeClaimTemplates/x-kubernetes-preserve-unknown-fields"}]'
```

Ref: https://www.elastic.co/guide/en/cloud-on-k8s/current/release-highlights-1.7.0.html

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
| 20211209 | v2.2.0     | Update Operator to 1.9.0 manifest                             |
| 20211209 | v2.2.0     | Update Operator to 2.2.0 manifest                             |
