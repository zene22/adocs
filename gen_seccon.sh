#!/usr/bin/env bash

set -x

TOP_LEVEL=$(git rev-parse --show-toplevel)

CUR_DIR=$(pwd)

RELATIV=${CUR_DIR##$TOP_LEVEL}

podman run --rm --name asciidoctor \
	-v "${TOP_LEVEL}"/:/documents/test/:z \
	-w /documents/test"${RELATIV}" \
	asciidoctor/docker-asciidoctor \
	asciidoctor-pdf -r asciidoctor-diagram \
	-o results/secure-container-lifecycle.pdf \
	-a ej-base-dir=/documents/test"${RELATIV}" \
	-a ej-projectdir=/documents/test"${RELATIV}" seccon-master.adoc
