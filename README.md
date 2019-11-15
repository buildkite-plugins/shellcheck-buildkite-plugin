# Shellcheck Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) that runs [shellcheck](https://github.com/koalaman/shellcheck) against your shell scripts using the [koalaman/shellcheck](https://hub.docker.com/r/koalaman/shellcheck/) docker image.

## Example

This will check all shellscripts with shellcheck.

```yml
steps:
  - plugins:
      - shellcheck#v1.1.2:
          files: scripts/*.sh
```

## Configuration

### Required

### `files` (string or array of strings)

The files (or globs) to run shellcheck on.

### Optional

### `options` (string or array of strings)

Command line options to pass to shellcheck.

Default: `"--color=always"`

### `version` (string)

Version of docker image to use.

Default: `latest`

## License

MIT (see [LICENSE](LICENSE))
