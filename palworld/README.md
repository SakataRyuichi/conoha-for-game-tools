# Palworld 設定変更ツール

ConoHa for GAME の Palworld サーバーの設定変更を補助するスクリプトです。

## 機能
以下の項目を設定できます。

- コミュニティサーバー有効化／無効化
- サーバー名
- サーバーパスワード
- 管理パスワード
- サーバー参加人数
- RCONの有効化／無効化


## 使い方
ConoHa for GAME で Palworld サーバーをインストールした後、rootでログインして以下のコマンドを実行します。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shinya-blogger/conoha-for-game-tools/main/palworld/config.sh)"
```


## 仕様

当スクリプトは以下のファイルを更新します。

- /etc/systemd/system/palworld-server.service.d/override.conf
- /opt/palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini

また UFW 設定を更新します。


## 解説記事

以下の記事で詳しい使い方を解説しています。

[https://kozenist.com/conoha-for-game-palworld-server/](https://kozenist.com/conoha-for-game-palworld-server/)


## ライセンス

MITライセンスです。

[https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE](https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE)