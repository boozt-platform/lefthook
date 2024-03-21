# jsonlint hook

Validation tool for JSON files. [https://github.com/zaach/jsonlint](https://github.com/zaach/jsonlint)

## Configuration

Currently, we are using this tool to validate our JSON files and run a git
patch to fix it due to formatting issues. So by default, we use it to sort
the keys and automatically update the actual files (and lefthook will execute
the `git add`).

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # validate the JSON files
      - hooks/jsonlint/.lefthook.yaml
```
