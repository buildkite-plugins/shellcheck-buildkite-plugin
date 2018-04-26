#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# export DOCKER_STUB_DEBUG=/dev/tty

@test "Shellcheck a single file" {
  export BUILDKITE_PLUGIN_SHELLCHECK_FILES_0="tests/testdata/test.sh"

  stub docker \
    "run --rm -v $PWD:/mnt --workdir /mnt koalaman/shellcheck tests/testdata/test.sh : echo testing test.sh"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "testing test.sh"

  unstub docker
}

@test "Shellcheck multiple files" {
  export BUILDKITE_PLUGIN_SHELLCHECK_FILES_0="tests/testdata/test.sh"
  export BUILDKITE_PLUGIN_SHELLCHECK_FILES_1="tests/testdata/subdir/*"
  export BUILDKITE_PLUGIN_SHELLCHECK_FILES_2="missing"

  stub docker \
    "run --rm -v $PWD:/mnt --workdir /mnt koalaman/shellcheck tests/testdata/test.sh tests/testdata/subdir/llamas.sh tests/testdata/subdir/shell\ with\ space.sh' : echo testing test.sh"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "testing test.sh"

  unstub docker
}

@test "Shellcheck failure" {
  export BUILDKITE_PLUGIN_SHELLCHECK_FILES_0="tests/testdata/subdir/llamas.sh"

  stub docker \
    "run --rm -v $PWD:/mnt --workdir /mnt koalaman/shellcheck tests/testdata/test.sh tests/testdata/subdir/llamas.sh tests/testdata/subdir/shell\ with\ space.sh' : echo shellcheck failed; exit 1"

  run "$PWD/hooks/command"

  assert_failure
  assert_output --partial "shellcheck failed"

  unstub docker
}
