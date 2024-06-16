<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_ssm_parameter.amzn2_latest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of public subnets | `list(string)` | n/a | yes |
| <a name="input_sg_a_id"></a> [sg\_a\_id](#input\_sg\_a\_id) | ID of the security group A | `string` | n/a | yes |
| <a name="input_sg_b_id"></a> [sg\_b\_id](#input\_sg\_b\_id) | ID of the security group B | `string` | n/a | yes |
| <a name="input_sg_c_id"></a> [sg\_c\_id](#input\_sg\_c\_id) | ID of the security group C | `string` | n/a | yes |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The ARN of the target group | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->