# ARK設定変更ツール

ConoHa for GAME の ARK: Survival Evolved サーバーの設定変更を補助するスクリプトです。

## 機能
以下の項目を設定できます。

- サーバー名
- 参加パスワード
- 管理パスワード
- RCON有効／無効


## 使い方
ConoHa for GAME で ARK: Survival Evolved サーバーをインストールした後、rootでログインして以下のコマンドを実行します。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shinya-blogger/conoha-for-game-tools/main/ark/config.sh)"
```


## 仕様

当スクリプトは以下のファイルを作成または更新します。

- /etc/systemd/system/ark-server.service.d/override.conf
- /opt/ark/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini


## 解説記事

以下の記事で詳しい使い方を解説しています。

[https://kozenist.com/conoha-for-game-ark-server/](https://kozenist.com/conoha-for-game-ark-server/)


## ライセンス

MITライセンスです。

[https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE](https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE)