# 「12ステップで作る 組込みOS自作入門」用 VSCode ビルド環境

サポートページ: https://kozos.jp/books/makeos/

## 使用方法

本開発環境は Visual Studio Code Dev Containers 向けです。
`.devcontainer/devcontainer.json`から以下のようにイメージを指定してください。

```json
{
	"name": "Ubuntu 20.04",
	"image": "ghcr.io/ashtkn/kozos-devcontainer:v1.0.0",
	"customizations": {
		"vscode": {
			"extensions": [
				"editorconfig.editorconfig",
				"ms-vscode.cpptools-extension-pack",
				"ms-vscode.makefile-tools",
				"ms-azuretools.vscode-docker",
				"streetsidesoftware.code-spell-checker"
			]
		}
	}
}
```
