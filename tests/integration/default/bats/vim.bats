#!/usr/bin/env bats

@test "vim binary is found in PATH" {
  run which git
  [ "$status" -eq 0 ]
}
