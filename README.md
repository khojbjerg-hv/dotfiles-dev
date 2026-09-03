# Dotfiles for Dev Container
This repository holds dotfiles for configuring development environment inside a [Dev Container](https://containers.dev/). 

[Mise](https://mise.jdx.dev/) is used to manage and install [LazyVim](https://www.lazyvim.org/) and project specific dependencies.

## Container Image Requirements
A user with sudo privileges, named 'dev'. Change USER variable in [setup](https://github.com/khojbjerg-hv/dotfiles-dev/setup), if container user is called something else.

Following packages needs to be baked into the image:
- sudo
- zsh
- git
- curl
- gcc


## Setup new Dev Container
Dev Containers build and run using [Dev Container CLI](https://github.com/devcontainers/cli).

Dev Container CLI clone dotfiles from repository and run the setup script automatically:
```zsh
devcontainer up --dotfiles-repository https://github.com/khojbjerg-hv/dotfiles-dev
```

Access the Dev Container using devcontainer or docker exec. 
```zsh
devcontainer exec zsh
```

From the project directory /workspaces/project1:
1. Run mise install
```zsh
mise install
```

2. If new environment goto (a) if existing go to (b)

    a) Using uv run.
    ```zsh
    uv init
    uv venv
    ```
    UV will init the environment and create a venv (/home/dev/.venv).
    Mise will source the environment automatically.

    b) Using uv run.
    ```zsh
    uv sync
    ```
    UV will create the venv and install python requirements.
    Mise will source the environment automatically.

*When neovim opens for the first time it will install its packages defined in .config/nvim.*
*Install ruff and pyright using UV. Neovim will detect external formatting and linting automatically.*


### Dev Container Image exampler
Simple Custom Dev Container config.

Dockerfile :
```Dockerfile
FROM fedora:44

ARG USER=dev

RUN dnf -y install \ 
    git \
    sudo \
    curl \
    tar \
    unzip \
    gcc \
    zsh \
    which \
    && dnf clean all \
    && rm -rf /var/cache/dnf

RUN useradd \
    --create-home \
    --shell /bin/bash \
    "${USER}" \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER ${USER}
```

devcontainer.json :
```json
{
  "name": "fedora-dev",
  "build": {
    "context": ".",
    "dockerfile": "Dockerfile"
  },
  "remoteUser": "dev"
}
```

*Dockerfile and devcontainer.json located in .devcontainer/ inside project directory.*
