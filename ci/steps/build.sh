#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")/.."

rm -r bin > /dev/null 2>&1 || true
mkdir -p bin

emptytar() {
	tar -czvf "$1" --files-from=/dev/null
}

if [[ "$(uname)" == "Darwin" ]]; then
	emptytar bin/coder-cli-darwin-amd64.tar.gz
else
	echo "Warning: Darwin builds don't work on Linux."
	echo "Please use an OSX machine to build Darwin tars."
fi

emptytar bin/coder-cli-linux-amd64.tar.gz
echo UEsFBgAAAAAAAAAAAAAAAAAAAAAAAA== | base64 -d > bin/coder-cli-windows-386.zip
