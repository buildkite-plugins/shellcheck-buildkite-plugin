# Shellcheck Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) that runs [shellcheck](https://github.com/koalaman/shellcheck) against your shell scripts using the [koalaman/shellcheck](https://hub.docker.com/r/koalaman/shellcheck/) docker image.

## Example

This will check all shellscripts with shellcheck.

```yml
steps:
  - plugins:
      shellcheck#v1.1.0:
        files: scripts/*.sh
```

## Options

### `files`

The files (or globs) to run shellcheck on

## License

MIT (see [LICENSE](LICENSE))
