# latex-setup
Template repo for setting up my LaTeX environment

LaTeX環境を一式そろえるためのテンプレートリポジトリ．

## 関係あるリポジトリ

- [tex-template](https://github.com/mo-mo-666/tex-template): LaTeXファイルのヘッダーで読み込むコマンド群をまとめたファイルを集めたリポジトリ，デフォルトでsubmoduleとして読み込まれる
- [latex-actions](https://github.com/mo-mo-666/latex-actions): GitHub Actionsを使ってLaTeXファイルをコンパイルする環境を整えるためのリポジトリ．うまくいったworkflowは，このリポジトリの`.github/workflows`にコピーして使っている．
- [latex-docker](https://github.com/mo-mo-666/latex-docker): オリジナルのDockerイメージを作るためのリポジトリ



## DockerをVSCodeのdevcontainerで動かす際のSSHキーの共有について
Dockerコンテナ内にそもそもSSHがインストールされていないと使えないので，まずそれを確認する．

基本は
[Sharing Git credentials with your container](https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials)
にしたがって，[dotfiles](https://github.com/mo-mo-666/dotfiles)を書いているが，
もしうまくいかない場合は
`~/.ssh/config`に以下を追記する(ファイルがない場合は作成する)．

```
Host github.com
  HostName github.com
  User git
  Port 22
  IgnoreUnknown UseKeychain
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
  IdentitiesOnly yes
  AddKeysToAgent yes
```
一度再起動する．WSLの場合はpowershellで
```powershell
wsl --shutdown
```
でもよい．
