#!/usr/bin/env bash

REPO_INPUT="[scala-archive]
name=scala-archive
baseurl=https://rochala.github.io/sbtn-dist/rpm
gpgcheck=1
gpgkey=https://rochala.github.io/sbtn-dist/debian/scala-archive-keyring.gpg
repo_gpgcheck=1
enabled=1
"

SCRIPT="echo \"$REPO_INPUT\" > /etc/yum.repos.d/scala-archive.repo &&
  yum update -y &&
  yum install -y curl java-17-openjdk-devel sbt &&
  cd ~/ &&
  sbt new scala/scala3.g8 --name=sbt-test &&
  cd sbt-test &&
  sbt run
"

docker run \
  --rm \
  fedora \
  sh -c "$SCRIPT"
