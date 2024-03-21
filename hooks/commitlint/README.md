# commitlint hook

This hook checks if the commit message follows the conventional commits
framework. For a full information take a look at CONTRIBUTING.md guideline
(Updating Code section).

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # lint commit messages based by the conventional commits
      - hooks/commitlint/.lefthook.yaml
```

## Configuration

The script supports two environment variables that can be reconfigured. You
can define the environment variables as follows:

```shell
# default values for environment variables
export MAX_COMMIT_MESSAGE_LENGTH=80
# valid commit prefix types for semantic versioning
export VALID_COMMIT_PREFIXES="build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test"
```

Alternatively, you can create a `.commitlint` environment file in the project
root, and the script will automatically source it:

```bash
# .commitlint

# default values for environment variables
MAX_COMMIT_MESSAGE_LENGTH=80

# valid commit prefix types for semantic versioning
VALID_COMMIT_PREFIXES="build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test"
```
