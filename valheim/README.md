# Valheim 設定変更ツール

ConoHa for GAME の Valheim サーバーの設定変更を補助するスクリプトです。

## 機能
以下の項目を設定できます。

- サーバー名
- パスワード
- ワールド
- 管理者
- BepInExインストール・アンインストール


## 使い方
ConoHa for GAME で Valheim サーバーをインストールした後、rootでログインして以下のコマンドを実行します。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shinya-blogger/conoha-for-game-tools/main/valheim/config.sh)"
```


## 仕様

当スクリプトは以下のファイルを作成または更新します（BepInEx本体を除く）。

- /home/valheim/.config/unity3d/IronGate/Valheim/adminlist.txt
- /opt/valheim_server/gmovps_start_valheim_server.sh
- /opt/valheim_server/gmovps_start_valheim_server_bepinex.sh
- /etc/systemd/system/valheim_server.service.d/override.conf

BepInExインストール後は、valheim_serverサービスの起動スクリプトをgmovps_start_valheim_server_bepinex.shに変更します。


## 解説記事

以下の記事で詳しい使い方を解説しています。

[https://kozenist.com/conoha-for-game-valheim-server/](https://kozenist.com/conoha-for-game-valheim-server/)


## ライセンス

MITライセンスです。

[https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE](https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE)