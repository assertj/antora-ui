#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

BUNDLE_URL='https://gitlab.com/antora/antora-ui-default/-/jobs/artifacts/HEAD/raw/build/ui-bundle.zip?job=bundle-stable'

# Remove leftovers from a previous run
rm -rf upstream.zip bundle ui-bundle.zip

curl --fail --location --output upstream.zip "$BUNDLE_URL"
unzip -q upstream.zip -d bundle
cp --recursive --dereference supplemental-ui/. bundle/
find bundle -exec touch --date=@0 {} +
(cd bundle && find . -type f | LC_ALL=C sort | zip --quiet --strip-extra ../ui-bundle.zip --names-stdin)
