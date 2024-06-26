# Jinsu Kimの.dotfiles

## 一番最初何もない時

1. brewインストる
https://brew.sh/

2. git download
```shell
brew install git
```

## 最初すること
```
sh scripts/initialize.sh
```

## vimrc

- vimに関連するdotfileです

1. vim-plug関連install後、PlugInstallしてください
2. https://github.com/nanotech/jellybeans.vim をInstallしてください。

## oh-my-zsh

- oh-my-zsh関連するdotfileです

### .zshrc_company
- zshrc/.zshrc_companyファイルにはpullした後会社で利用しているコマンドを入力してください

## 利用するツールInstall

- [Postman](https://www.postman.com/)
- [TablePlus](https://tableplus.com/)
- [Notion](https://www.notion.so/ja-jp/desktop)
- [arc](https://arc.net/)
- [whale](https://whale.naver.com/en/download/mac/)
- [clipy](https://clipy-app.com/)
- [Alfred 5](https://www.alfredapp.com/)


## 参考になるブログ記事

[ようこそdotfilesの世界へ](https://qiita.com/yutkat/items/c6c7584d9795799ee164)

## git cloneする

gh repo clone KimJinsu66/study ~/Desktop/study

## iTerm2 透明設定

- **iTerm > Preferences > Profiles > Window > Transparency**
    - 現在20％で利用中

## Hotkey設定

https://qiita.com/okamu_/items/a5086d2d5ba405f35acb

gh repo clone KimJinsu67/study ~/Desktop/study

## UltiSnips関連エラーが発生した場合
```shell
brew install vim
```
コマンド実行後、再度画面を開いてください
:versionで確認してみるとpythonが正しく保存されてないことでエラーが発生しているぽい

## vim ale rubocopをdocker-compose上で利用する
aleはdocker環境の対応を行なっていない、かつdocker-composeを上手くしても起動しないため手動でファイル作成が必要です
自分が利用しているプロダクトにrubocopファイルを作成し、scrips/rubocopのファイルをコピーしてください
