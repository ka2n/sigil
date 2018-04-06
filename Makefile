NAME=sigil
ARCH=$(shell uname -m)
ORG=ka2n
VERSION=0.4.0

test:
	basht tests/*.bash

deps:
	go get -u github.com/Songmu/goxz/cmd/goxz
	go get -u github.com/tcnksm/ghr
	go get -u github.com/progrium/basht/...
	go get -d ./cmd/sigil

build:
	goxz -pv $(VERSION) -os=linux,darwin -arch=amd64 -d ./release ./cmd/sigil

release:
	ghr $(VERSION) ./release

clean:
	rm -rf release

.PHONY: release build
