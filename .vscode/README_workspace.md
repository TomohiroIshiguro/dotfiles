# README about workspace
Update: 17th October, 2020 

マークダウン形式で書いた文書を PDFファイルに書き出す際に、文書スタイルを適用するため VSCodeの Workspace機能を用いる。  
*A4縦書き、ヘッダ／フッタ:「社外秘」、章番号、ページ番号、「以上」挿入。

## 準備するもの
### ツール
- VSCode + 'Markdown PDF' plugin
- Chrome

### 設定ファイル
- ./documents.code-workspace
- ./.css/md_ja.css

### 説明資料
- ./README_about_workspace.md

## ツール設定方法
1. Chromeをインストールする
2. VSCodeをインストールする
3. VSCodeに 'Markdown PDF' pluginを追加する

## 使い方
1. フォルダで documents.code-workspaceをダブルクリックすると、ファイル拡張子に関連づけられたツール VSCodeが立ち上がる。
2. VSCodeの左辺にワークスペース内のファイルツリーが表示されるので、マークダウン形式のファイル(.md)を選択する。
3. ファイルを開いたら、右クリックで 'Markdown PDF: Export(PDF)'を選択する。  
この状態で待つと、PDFファイルが作成される。(ヘッダ／フッタは Workspace、スタイルはCSSが適用される)
