# AssertJ Antora UI

AssertJ customizations for the [Antora default UI](https://gitlab.com/antora/antora-ui-default), used to build the [AssertJ documentation](https://docs.assertj.dev).

This repo does not build a UI from scratch.
Instead, a nightly workflow downloads the stable Antora default UI bundle, overlays the files in [`supplemental-ui/`](supplemental-ui/), and publishes the result as a GitHub Release asset (`ui-bundle.zip`) in case it changed.

To build `ui-bundle.zip` locally, run `npm ci && ./build.sh`.
