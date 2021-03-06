#!/usr/bin/env bash

# Base URL of our Helm repository.
HELM_REPO_BASE_URL=https://spotinst.github.io/spotinst-kubernetes-helm-charts/archives

function helm_index() {
	echo "==> Indexing repository..."

	${HELM} repo index \
		--debug \
		--url "${HELM_REPO_BASE_URL}" \
		./archives

	mv ./archives/index.yaml .
}

function main() {
	echo "==> Helm version: ${HELM_VERSION}"
	helm_index
}

main
