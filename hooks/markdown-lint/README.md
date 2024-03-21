# markdown-lint hook

markdownlint is a static analysis tool based in node.js with a library of rules
to enforce standards and consistency for Markdown files.

For a full configuration and documentation [follow this link](https://github.com/DavidAnson/markdownlint).

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # lint the markdown (.md) files
      - hooks/markdown-lint/.lefthook.yaml
```
