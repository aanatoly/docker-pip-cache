# pip-cache
This image runs `devpi` server serving as a caching proxy to the main index.

## Usage
```bash
docker run --rm -t --name pip-cache \
    -v /var/cache/pip-cache:/data \
    -p 3141:3141 \
    aanatoly/pip-cache
```
## Build
```bash
make build_MNPR     # build myimage:2.3.4-rc2
make push_MNP       # push as myimage:2.3.4
make push_MN        # push as myimage:2.3
```
[semver]: https://semver.org/
