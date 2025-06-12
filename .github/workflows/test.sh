#!/usr/bin/env bash

set -euo pipefail

opam --version
opam repository list
opam list
PACKAGES=("ocamlformat" "merlin" "ocaml-lsp-server" "utop")
PKGS=""
for pkg in "${PACKAGES[@]}"; do
    latest=$(find packages/$pkg -type f -name 'opam' \
        | grep '+jst' | sed -E 's|.*/([^/]+)/opam|\1|' \
        | sort -V | tail -1)
    PKGS="$PKGS $latest"
done
echo "Installing:$PKGS"
opam install $PKGS
opam list
