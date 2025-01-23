#!/usr/bin/env bash

# .mise.toml に記載された Flutter のバージョンを取得する

# .mise.tomlファイルのパス
MISE_TOML_PATH="$(dirname "$0")/../../.mise.toml"

# .mise.toml ファイルが存在するか確認
if [ ! -f "${MISE_TOML_PATH}" ]; then
  echo 'Error: .mise.toml file not found' >&2
  exit 1
fi

# .mise.tomlファイルからFlutterのバージョンを取得
FLUTTER_VERSION=$(grep 'flutter' "${MISE_TOML_PATH}" | sed -n 's/.*flutter = "\(.*\)-.*/\1/p')

# 取得したバージョンを表示
echo "${FLUTTER_VERSION}"
