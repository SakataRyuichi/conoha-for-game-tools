# 7 Days to Die設定変更ツール

ConoHa for GAME の 7 Days to Die サーバーの設定変更を補助するスクリプトです。

## 機能
以下の項目を設定できます。

- コントロールパネルの有効化・無効化
- 管理ユーザー
- サーバー名
- パスワード
- 地域
- 言語
- サーバー可視レベル
- 難易度
- マップ

## 使い方
ConoHa for GAME で 7 Days to Die サーバーをインストールした後、rootでログインして以下のコマンドを実行します。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shinya-blogger/conoha-for-game-tools/main/7dtd/config.sh)"
```

## 仕様

当スクリプトは以下のファイルを更新します。

- /opt/7dtd/7dtd_server/serverconfig.xml
- /home/sdtd/.local/share/7DaysToDie/Saves/serveradmin.xml

また UFW 設定を更新します。


## 解説記事

以下の記事で詳しい使い方を解説しています。

[https://kozenist.com/conoha-for-game-7dtd-server/](https://kozenist.com/conoha-for-game-7dtd-server/)


## ライセンス

MITライセンスです。

[https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE](https://github.com/shinya-blogger/conoha-for-game-tools/blob/main/LICENSE)