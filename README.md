# terraform-aws-icon-user-data 

[![open-issues](https://img.shields.io/github/issues-raw/robc-io/terraform-aws-icon-user-data ?style=for-the-badge)](https://github.com/robc-io/terraform-aws-icon-user-data /issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/robc-io/terraform-aws-icon-user-data ?style=for-the-badge)](https://github.com/robc-io/terraform-aws-icon-user-data /pulls)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```
module "this" {
    source = "github.com/robc-io/terraform-aws-icon-user-data "

}
```
## Examples

- [defaults](https://github.com/robc-io/terraform-aws-icon-user-data /tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| consul\_enabled | n/a | `bool` | `false` | no |
| disable\_ipv6 | n/a | `bool` | `true` | no |
| driver\_type | n/a | `string` | `""` | no |
| enable\_hourly\_cron\_updates | n/a | `string` | `"false"` | no |
| keys\_update\_frequency | n/a | `string` | `""` | no |
| log\_config\_bucket | n/a | `string` | `""` | no |
| log\_config\_key | n/a | `string` | `""` | no |
| nlb\_dns | n/a | `string` | `""` | no |
| node\_tags | The tag to put into the node exporter for consul to pick up the tag of the instance and associate the proper metrics | `string` | `"prep"` | no |
| prep\_ip | n/a | `string` | `""` | no |
| prometheus\_enabled | n/a | `bool` | `false` | no |
| s3\_bucket\_name | n/a | `string` | `""` | no |
| s3\_bucket\_uri | n/a | `string` | `""` | no |
| ssh\_user | n/a | `string` | `"ubuntu"` | no |
| type | n/a | `string` | n/a | yes |
| vpc\_cidr | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| user\_data | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [robc-io](github.com/robc-io)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.