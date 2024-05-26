# latex-setup
Template repo for setting up my LaTeX environment


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
