# 設定ファイルをGithubで管理する

Githubで設定ファイルを管理することによって、ファイルの復元と版管理が容易になる。  
そのため、異なる端末/仮想環境に移動しても普段の作業環境を容易に再現できる。

## 使い方

1. 端末/仮想環境で、dotfilesリポジトリをcloneする
   `$ git clone https://github.com/TomohiroIshiguro/dotfiles.git ~`

1. ~/dotfiles/setup.shを実行する
   - 各設定ファイルのシンボリックリンクを作成
   - git submoduleでVundleをインストール

1. vimを開いて `:BundleInstall` コマンドを実行する
   - Vundleの機能で Vimのプラグインをインストールする

以上

## トラブルシューティング

- 設定ファイルがすでに存在する場合  
  既存のファイルを上書きしないよう別名でリンクを貼っています(ファイル名.copy_failed)。ファイルの内容を確認して、手動で設定を追記してください。 
