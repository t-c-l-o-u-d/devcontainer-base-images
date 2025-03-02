<!-- GNU Affero General Public License v3.0 or later (see COPYING or https://www.gnu.org/licenses/agpl.txt) -->

## About
This repository was designed to be used as a [submodule](https://git-scm.com/docs/git-submodule) in other projects.

## License
[GNU General Public License v3.0+](COPYING)

## Usage
Use this in your project:
```bash
$ git submodule add https://github.com/t-c-l-o-u-d/config-bash.git .submodules/config-bash
```

* `.bashrc` should be placed at `~/.bashrc`
* `aliases` should be placed at `~/.conifg/bash/aliases`
* `functions` should be placed at `~/.config/bash/functions`
* An additional file based on the `hostname` can be placed at `~/.config/bash/<hostname>`

## Contributing
This repository reflects my personal perspective and design choices. I'm open to community input and suggestions, but I'll be selective about incorporating new features to preserve the project's intended purpose and integrity.
