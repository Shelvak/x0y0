#!/bin/sh

SED_COMMAND='sed'
if test "$(uname)" = "Darwin"; then
  SED_COMMAND='gsed'
fi


read -p "Converting X0Y0 (mayus) in: " choice
egrep -rl 'X0Y0' * | xargs $SED_COMMAND -i "s/X0Y0/$choice/g"

read -p "Converting x0y0 (minus) in: " choice
egrep -rl 'x0y0' . | xargs $SED_COMMAND -i "s/x0y0/$choice/g"

rm -Rf .git
git init .
