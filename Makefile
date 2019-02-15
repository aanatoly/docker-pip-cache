# See README.md for details
ifeq ($(MAKECMDGOALS),init)
init:
	pip install --user -U semver-tool
else

export CI_COMMIT_DESC := $(shell semver-tool)

build_%:
	set -e; \
	export IMAGE_TAG=$(shell semver-tool -f $*); \
	docker-compose build

push_%: build_%
	set -e; \
	export IMAGE_TAG=$(shell semver-tool -f $*); \
	docker-compose push

endif
