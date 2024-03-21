# shellcheck hook

A shell script static analysis tool. [https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # lint shell scripts
      - hooks/shellcheck/.lefthook.yaml
```
