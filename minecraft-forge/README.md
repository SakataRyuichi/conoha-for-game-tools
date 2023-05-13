# ConoHa for GAME 向け Minecraft Forge バージョン変更ツール

ConoHa for GAME で Minecraft Forge サーバーのバージョン変更（ダウングレード・アップデート）が行えるスクリプトです。

## 事前準備
- ConoHa for GAME で Minecraft Forge テンプレートでサーバーを作成する
- Minecraft manager を開き、バックアップを作成する

## セットアップ手順
- サーバー詳細画面で、[コンソール]ボタンをクリックします。
- butterfly の画面が表示されるので、[Enter]キーを押します。
- ログインIDは root、パスワードはサーバー作成時に指定したrootパスワードを指定して[Enter]キーを押します。
- 以下のコマンドを実行します。
```
curl -s https://raw.githubusercontent.com/shinya-blogger/conoha-for-game-tools/main/minecraft-forge/install.sh | bash -s <バージョン>
```
以下が実行例です。
```
curl -s https://raw.githubusercontent.com/shinya-blogger/conoha-for-game-tools/main/minecraft-forge/install.sh | bash -s 1.19.2
```
## 注意事項
- 当スクリプトでバージョン変更を行った後は、Minecraft manager でのバージョンアップはできません。
- Minecraft manager が対応しているバージョンは 1.19系、1.16系、1.12系 です。これ以外のバージョンに変更すると、Minecraft manager が正しく動作しません。