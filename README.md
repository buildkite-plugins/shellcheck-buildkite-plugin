# Shellcheck Buildkite Plugin

__This is designed to run with Buildkite Agent v3.x beta. Plugins are not yet supported in Buildkite Agent v2.x.__

Runs [shellcheck](https://github.com/koalaman/shellcheck) against your shell scripts using the [koalaman/shellcheck](https://hub.docker.com/r/koalaman/shellcheck/) docker image.

## Example

This will check all shellscripts with shellcheck.

```yml
steps:
  - plugins:
      shellcheck#v1.0.0:
        files: scripts/*.sh
```

## Options

### `files`

The files (or globs) to run shellcheck on

## License

MIT (see [LICENSE](LICENSE))
