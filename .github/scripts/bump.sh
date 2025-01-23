#!/usr/bin/env bash

# pubspec.yaml に記載されたバージョンを元に bump する
# 引数は major, minor, patch のいずれかを指定する

project_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../.. && pwd)
pubspec_file="${project_dir}/pubspec.yaml"
version=$(grep -E '^version:' "${pubspec_file}" | head -1 | sed -E 's/.*([0-9]+\.[0-9]+\.[0-9]+).*/\1/' | tr -d '\n')

# 指定されたバージョンアップレベルに基づいて、新しいバージョンを算出
IFS='.' read -ra tokens <<<"${version:-0.0.0}"
major="${tokens[0]}"; minor="${tokens[1]}"; patch="${tokens[2]}"
case "${1}" in
  major) major="$((major + 1))"; minor=0; patch=0 ;;
  minor) minor="$((minor + 1))"; patch=0 ;;
  patch) patch="$((patch + 1))" ;;
  *) echo "Usage: $0 {major|minor|patch}"; exit 1 ;;
esac

new_version="${major}.${minor}.${patch}"
echo "${new_version}"
