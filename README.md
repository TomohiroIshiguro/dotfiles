# アプリのインストールと設定ファイルをGithubで管理する

Githubでアプリのインストールと設定ファイルを管理することによって、アプリのインストール、作業環境ファイルの復元と版管理が容易になる。
異なる端末/仮想環境に移動しても普段の作業環境を容易に再現できるメリットがある。

## 対象ツール

- CLI ツール
- GUI ツール
- shell
- vim
- tmux

## 使い方

1. 端末/仮想環境で、dotfilesリポジトリをcloneする
   `$ git clone https://github.com/TomohiroIshiguro/dotfiles.git ~`

2. `$ make setup-{OS}` を実行する
   - アプリケーションをインストール
   - 各設定ファイルのシンボリックリンクを作成
   - git submoduleでVundleをインストール
   - Vundleの機能で Vimのプラグインをインストールする

以上

## トラブルシューティング

- 設定ファイルがすでに存在する場合
  既存のファイルを上書きしないよう、既存のファイルはバックアップしてから上書きしています(ファイル名.yyyymmddHHMMSSbk)。
