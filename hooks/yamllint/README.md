# yamllint hook

A linter for YAML files. It checks the syntax validity, key repetition,
cosmetic issues as such lines length, trailing spaces, indentations and etc.

For a full configuration and documentation [follow this link](https://yamllint.readthedocs.io/en/stable/).

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # A linter for YAML files.
      - hooks/yamllint/.lefthook.yaml
```
