<!-- GNU Affero General Public License v3.0 or later (see COPYING or https://www.gnu.org/licenses/agpl.txt) -->
# Custom [Development Container](https://containers.dev/) Images

Available Images:

1. [Arch Linux](https://archlinux.org/)  
    `ghcr.io/t-c-l-o-u-d/devcontainer-base-images/arch-linux-devcontainer:latest`
2. [Fedora](https://fedoraproject.org/)  
    `ghcr.io/t-c-l-o-u-d/devcontainer-base-images/fedora-devcontainer:latest`
3. [Ubuntu LTS](https://ubuntu.com/)  
    `ghcr.io/t-c-l-o-u-d/devcontainer-base-images/ubuntu-lts-devcontainer:latest`

## Usage
```bash
$ cp template/Containerfile /your/repo/.devcontainer/Containerfile

$ cp template/devcontainer.json /your/repo/.devcontainer/devcontainer.json
```
Modify `Containerfile` to include any additional items needed for your repository.

## Contributing
This repository reflects my personal perspective and design choices. I am open to community input and suggestions, but I will be selective about incorporating new features to preserve the project's intended purpose and integrity.
