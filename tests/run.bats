#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

export DOCKER_STUB_DEBUG=/dev/tty
export LS_STUB_DEBUG=/dev/tty

@test "Shellcheck a single file" {
  export BUILDKITE_PLUGIN_SHELLCHECK_FILES_0="llamas.sh"

  stub ls \
    "-1 llamas.sh : echo llamas.sh"

  stub docker \
    "run --rm -v $PWD:/mnt koalaman/shellcheck llamas.sh : echo testing llamas.sh"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "testing llamas.sh"

  unstub ls
  unstub docker
}
