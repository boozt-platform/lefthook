# Terraform hook

The hook helps to maintain the quality and consistency of your Terraform code
by automatically formatting, validating, and testing it at different stages of
the development workflow.

## Features

### Pre-commit Hook

The pre-commit hook will run `terraform fmt` and `terraform validate` to ensure
your Terraform code is properly formatted and valid before committing.

### Pre-push Hook

The pre-push hook will run `terraform test` to ensure your Terraform code
passes all tests before pushing to the remote repository.

### Direct Execution

You can also run the Terraform commands directly using Lefthook. I.e.
`lefthook run terraform` or `lefthook run terraform --commands fmt`.

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # terraform validation, fmt and tests
      - hooks/terraform/.lefthook.yaml
```

Do extend or override the commands you may do as following:

```yaml
# .lefthook-local.yaml
extends:
  - hooks/terraform/.lefthook.yaml

# this would override the Terraform default version
terraform:
  commands:
    fmt:
      env:
        TF_VERSION: 1.10.5
```
