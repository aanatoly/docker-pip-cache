# docker-pip-cache
This image runs `devpi` server serving as a caching proxy to the main index.

## Usage
Start the server
```bash
docker run --rm -t --name pip-cache \
    -v /var/cache/pip-cache:/data \
    -p 3141:3141 \
    aanatoly/pip-cache
```
Run pip
```bash
PHOST=localhost
pip install --trusted-host $PHOST --index-url http://$PHOST:3141/root/pypi/+simple/ tox
```

## Build an image
```bash
make build_MNPR     # build myimage:2.3.4-rc2
make push_MNP       # push as myimage:2.3.4
make push_MN        # push as myimage:2.3
```
[semver]: https://semver.org/
