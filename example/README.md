# Module - terraform-google-network-subnet

## Overview

Terraform module which creates a google cloud subnetwork with options for [secondary CIDR ranges](https://cloud.google.com/vpc/docs/alias-ip#subnet_primary_and_secondary_cidr_ranges).
## Usage

### With Secondary CIDR Range

```hcl
module "aliased-subnetwork" {
  source = "./modules/subnetwork" # or url from terraform registry

  name          = "aliased-subnet"
  project       = "my_project"
  description   = "Aliased Subnet"
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = "10.100.0.0/24"

  create_secondary_ranges = true
  secondary_ranges        = [
    {
      range_name    = "range-1"
      ip_cidr_range = "10.101.0.0/24"
    },
    {
      range_name    = "range-2"
      ip_cidr_range = "10.102.0.0/24"
    },
  ]
}
```

### Without Secondary CIDR Range

```hcl
module "basic-subnetwork" {
  source = "./modules/subnetwork"  # or url from terraform registry

  name          = "basic-subnet"
  project       = "my_project"
  description   = "Basic Subnet"
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = "10.100.0.0/24"

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.67 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 3.67 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_subnetwork.basic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.ranged](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_secondary_ranges"></a> [create\_secondary\_ranges](#input\_create\_secondary\_ranges) | Enable secondary ip ranges to be used with 'secondary\_ranges' variable | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description usage of subnet | `string` | `""` | no |
| <a name="input_ip_cidr_range"></a> [ip\_cidr\_range](#input\_ip\_cidr\_range) | IP range in CIDR format of the subnet | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of subnet. | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | Name of self-link to the VPC this subnet will be linked to. Defaults to 'default' network | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Network project name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region in which subnet will be created. Defaults to the region in the terraform provider | `string` | `""` | no |
| <a name="input_secondary_ranges"></a> [secondary\_ranges](#input\_secondary\_ranges) | Create up to 5 alternative CIDR range to represent this subnetwork | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_address"></a> [gateway\_address](#output\_gateway\_address) | The IP address of the gateway. |
| <a name="output_ip_cidr_range"></a> [ip\_cidr\_range](#output\_ip\_cidr\_range) | The IP address range that machines in this network are assigned to, represented as a CIDR block. |
| <a name="output_name"></a> [name](#output\_name) | Subnetwork name. |
| <a name="output_secondary_range"></a> [secondary\_range](#output\_secondary\_range) | List of names for the secondary ranges created. |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Development

### Reference

- [Terraform GCP Subnetwork](https://www.terraform.io/docs/providers/google/d/datasource_compute_subnetwork.html)
- [Terraform Modules](https://www.terraform.io/docs/modules/usage.html)
- [Terraform Interpolation](https://www.terraform.io/docs/configuration/interpolation.html)
- [GCP Alias Subnetworks](https://cloud.google.com/vpc/docs/alias-ip#subnet_primary_and_secondary_cidr_ranges)

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

- Configure golang deps for tests
```sh
> go get github.com/gruntwork-io/terratest/modules/terraform
> go get github.com/stretchr/testify/assert
```

### Tests

- Tests are available in `test` directory
- In the test directory, run the below command
```sh
go test
```


