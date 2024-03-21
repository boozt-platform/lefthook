# license-checker hook

This hook checks if the git staged files contain a license header. The script
supports excluding certain files from the check, helping to ignore undesirable
files.

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

You may customize the license header and the file extensions to exclude for the
checks using the environment variables.

You can define the environment variables as follows:

```shell
# Define the license header
export LICENSE_HEADER=$(cat <<EOF
SPDX-FileCopyrightText: Copyright Boozt Fashion
SPDX-License-Identifier: MIT
EOF
)

# Define the regular expression of unwanted files to be checked
export EXCLUDE_FILES_EXT="LICENSE|\\.md|\\.gitignore|\\.license-checker.txt|CODEOWNERS|\\.gitattributes|\\.editorconfig|\\.json|\\.lock|\\.toml"
```

Another way to pass the license header is by creating a `.license-checker.txt`
file at the root of the project directory and placing your license content
inside.
