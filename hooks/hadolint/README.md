# hadolint hook

A Dockerfile linter that helps to build Docker images by following the best
practices. [https://github.com/hadolint/hadolint](https://github.com/hadolint/hadolint)

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # lint Dockerfiles
      - hooks/hadolint/.lefthook.yaml
```
