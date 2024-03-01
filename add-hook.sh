#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT

export NAME="${NAME:-""}"
export DOCKERFILE="${DOCKERFILE:-false}"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
HOOKS_DIR="hooks"
HOOKS_PATH="${SCRIPT_DIR}/${HOOKS_DIR}"

# error message function printing in red color
# usage: error "message"
error() {
    local message=${1:-""}
    echo -e "\033[0;31m${message}\033[0m"
}

# create hooks dir if not exists
if [ ! -d "${HOOKS_PATH}" ]; then
    mkdir -p "${HOOKS_PATH}"
fi

# check if the NAME environment variable is not empty
if [ -z "$NAME" ]; then
    error "The NAME environment variable is empty"
    exit 1
fi

# check if the given module name not yet exists to be able to create a new module
if [ -d "${HOOKS_PATH}/${NAME}" ]; then
    error "The module ${NAME} already exists"
    exit 1
fi

# create a new module directory
mkdir -p "${HOOKS_PATH}/${NAME}"

# create .lefthook.yaml file with the SPDX license in it
cat > "${HOOKS_PATH}/${NAME}/.lefthook.yaml" <<EOF
# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT
EOF

# create Dockerfile if the DOCKERFILE environment variable is set and
# add the SPDX license to the Dockerfile
if [ "$DOCKERFILE" = "true" ]; then
    cat > "${HOOKS_PATH}/${NAME}/Dockerfile" <<EOF
# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT
EOF

    # output yaml configuration for .goreleaser.yaml file
    # so it can be manually added in order to build the
    # docker images for the new module.
    cat <<EOF
dockers:
  # Docker images for the ${NAME} module
  - image_templates:
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:{{ .Version }}-amd64"
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:latest-amd64"
    use: buildx
    dockerfile: ${HOOKS_DIR}/${NAME}/Dockerfile
    build_flag_templates:
      - "--platform=linux/amd64"
  - image_templates:
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:{{ .Version }}-arm64"
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:latest-arm64"
    use: buildx
    dockerfile: ${HOOKS_DIR}/${NAME}/Dockerfile
    build_flag_templates:
      - "--platform=linux/arm64"
  - image_templates:
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:{{ .Version }}-386"
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:latest-386"
    use: buildx
    dockerfile: ${HOOKS_DIR}/${NAME}/Dockerfile
    build_flag_templates:
      - "--platform=linux/386"

docker_manifests:
  # Docker manifest for the ${NAME} module
  - name_template: "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:{{ .Version }}"
    image_templates:
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:{{ .Version }-amd64"
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:{{ .Version }-arm64"
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:{{ .Version }-386"
  - name_template: "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:latest"
    image_templates:
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:latest-amd64"
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:latest-arm64"
      - "{{ .Env.REGISTRY }}/{{.ProjectName}}-${NAME}:latest-386"
EOF
fi

exit 0
