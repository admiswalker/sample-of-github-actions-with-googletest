# sample-of-github-actions-with-googletest

## GitHub Actions の設定

GitHub Actions は，GitHub 上で実行される push や merge request などの動作と連動して，事前に定義しておいた定形動作を実行する機能である．主に CI/CD の実現に利用される．

### 使い方
GitHub Actions を利用するには，repository の `.github/workflows/` directory 下に \*.yml ファイルを用意する．GitHub は main branch への push や，main branch への mearge request をトリガーとして，\*.yml ファイルの設定に従い処理を実行する．

#### 実行環境の設定
`runs-on` option より実行環境を選択できる．
特に理由がなければ `ubuntu-latest` (あるいは，バージョン固定した ubuntu) などを選択しておく．

#### Repostiory の読み込み設定
Repostiory を読み込むには，`actions/checkout@v2` を使う．
このとき，読み込む branch を指定する．

例：
```yml
steps
- name: checkout repository
  uses: actions/checkout@v2
  with:
    ref: main
```

#### build と test の設定
build や test は，local と同様に実行コマンドを記載する．



## 参考
- [GitHub Actionsを使ってみた @toppy-luna](https://qiita.com/toppy-luna/items/8358c19bbfb2aee4e848)