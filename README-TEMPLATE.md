# <%= module_name %>

## Overview

<%= description %>

## Usage

```hcl
  module "module_exemple" {
    source  = "Arquivei/modules/module_exemple"
    version = "1.0"
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.50 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.50 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 3.50 |
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.example](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | GCP project id that will be used | `string` | n/a | yes |
| <a name="input_mandatory"></a> [mandatory](#input\_mandatory) | this field is mandatory | `string` | n/a | yes |
| <a name="input_optional"></a> [optional](#input\_optional) | this field is optional | `string` | `"default_value"` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region, e.g. southamerica-east1 | `string` | `"us-east1"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | GCP zone, e.g. us-east1-b, us-east1-c (which must be in gcp\_region) | `list(string)` | <pre>[<br>  "us-east1-b",<br>  "us-east1-c",<br>  "us-east1-d"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output_name"></a> [output\_name](#output\_output\_name) | description for output\_name |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Development

### Prerequisites

- [terraform](https://learn.hashicorp.com/terraform/getting-started/install#installing-terraform)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [pre-commit](https://pre-commit.com/#install)
- [golang](https://golang.org/doc/install#install)
- [golint](https://github.com/golang/lint#installation)

### Configurations

- Configure pre-commit hooks
```sh
pre-commit install
```


