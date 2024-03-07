# license-checker hook

This hook checks if the git staged files contain a license header. The script supports excluding certain files from the check, helping to ignore undesirable files.

## How to Use It

```yaml
# .lefthook.yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: [tag]
    configs:
      # Check if the license headers are present in the files
      - hooks/license-checker/.lefthook.yaml
```

## Configuration

The script supports two environment variables that can be reconfigured. You can define the environment variables as follows:

```shell
# Define the license header
export LICENSE_HEADER=$(cat <<EOF
SPDX-FileCopyrightText: Copyright Boozt Fashion
SPDX-License-Identifier: MIT
EOF
)

# Define the regular expression of unwanted files to be checked
export EXCLUDE_FILES_EXT="LICENSE|\\.md|\\.gitignore|CODEOWNERS|\\.gitattributes|\\.editorconfig|\\.json|\\.lock|\\.toml"
```

Alternatively, you can create a `.license-checker` environment file in the project root, and the script will automatically source it:

```bash
# .license-checker

# Define the license header
LICENSE_HEADER=$(cat <<EOF
SPDX-FileCopyrightText: Copyright Boozt Fashion
SPDX-License-Identifier: MIT
EOF
)

# Define the regular expression of unwanted files to be checked
EXCLUDE_FILES_EXT="LICENSE|\\.md|\\.gitignore|CODEOWNERS|\\.gitattributes|\\.editorconfig|\\.json|\\.lock|\\.toml"
```
