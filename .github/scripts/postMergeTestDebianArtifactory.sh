#!/usr/bin/env bash

SCRIPT="
  apt update &&
  apt install -y curl default-jdk &&
  echo \"deb [arch=all] https://rochala.github.io/sbtn-dist/debian all main\" > /etc/apt/sources.list.d/scala-archive.list &&
  curl -sS \"https://rochala.github.io/sbtn-dist/debian/scala-archive-keyring.gpg\" > /etc/apt/trusted.gpg.d/scala-archive.gpg &&
  apt update &&
  apt install -y sbt &&
  cd ~/ &&
  sbt new scala/scala3.g8 --name=sbt-test &&
  cd sbt-test &&
  sbt run
"

docker run \
  --rm \
  ubuntu \
  sh -c "$SCRIPT"
