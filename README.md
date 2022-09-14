# Shellcheck Buildkite Plugin [![Build status](https://badge.buildkite.com/c5e8fc8efd91713b2f64222a79fb65d5ac3aa5c6717956b29b.svg?branch=master)](https://buildkite.com/buildkite/plugins-shellcheck)

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) that runs [shellcheck](https://github.com/koalaman/shellcheck) against your shell scripts using the [koalaman/shellcheck](https://hub.docker.com/r/koalaman/shellcheck/) docker image.

## Example

This will check all shellscripts with shellcheck.

```yml
steps:
  - plugins:
      - shellcheck#v1.2.0:
          files: scripts/*.sh
```

## Configuration

### Required

### `files` (string or array of strings)

The files (or globs) to run shellcheck on.

### Optional

### `extglob` (boolean)

Enable using [extended glob patterns](https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html), e.g. `*.+(sh|bash)`

Note: _requires at least Bash 4 on the Buildkite Agent_

Default: `false`

### `globstar` (boolean)

Enable using recursive globbing, e.g. `**/*.sh`

Note: _requires at least Bash 4 on the Buildkite Agent_

Default: `false`

### `options` (string or array of strings)

Command line options to pass to shellcheck.

Default: `"--color=always"`

### `version` (string)

Version of docker image to use.

Default: `latest`

## License

MIT (see [LICENSE](LICENSE))
