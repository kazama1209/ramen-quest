# Ramen Quest

[English.ver](https://github.com/kazama1209/ramen-quest/blob/master/README_EN.md)

[![CircleCI](https://circleci.com/gh/kazama1209/ramen-quest.svg?style=shield)](https://circleci.com/gh/kazama1209/ramen-quest)

## サービス概要

![ラーメンクエスト トップ](https://user-images.githubusercontent.com/51913879/71307376-d479be80-2430-11ea-9c83-cc57897de80e.png)

ラーメンほど奥深い食べ物はそうそうありません。お店によって全く異なる顔を見せてくれるラーメンをめぐる日々は、まさに冒険（quest）そのものとだと私は考えています。

「Ramen Quest」は、レビュー、ブックマーク、ランキング、カレンダーなどの機能を活用し、日々のラーメン巡りを効率的に記録するためのWEBサービス。

コツコツと積み重ねた結果を可視化し、それらをユーザー間で情報共有する事でラーメン好きにありがちな「承認欲求（ラーメン通である事に対する誇り）」の実現を目指します。

## 作る上で意識した事

一つ一つの機能自体はいたってシンプルなものばかりであり、画期的で面白みのある作品かどうかと問われればあまり自信はありません。しかしながら、Rails最大の強みでもある「MVCアーキテクチャ」の概念にひたすら忠実に従い、何よりも基本を意識した構成を心掛けております。

**また、ただ単に「見せるため」に作ったわけではなく、将来、実際に運用する事となった場合を想定し、そのために必要な技術も多数取り入れました。もし仮に明日正式にリリースする事になったとしても、十分に対応可能な状態になっていると思います。**

- admin状態のユーザーだけがアクセスできる管理画面
- ユーザー登録時のメールアクティベーション機能
- サイトマップやメタタグなどを用いたSEO対策
- DoS攻撃などに備えたセキュリティ対策
- 万が一例外が発生した場合の通知機能（Slackへ送信）
- 各種APIを利用した機能（ソーシャルログインやGoogleマップなど）
- CI/CDツールを使った自動テスト＆自動デプロイ

※より細かな導入技術については後述のリストや実際のコードを見ていただけると幸いです。

素人なりに、何よりもまずはユーザーの目線に立ち、一つのサービスを運営する上で必要なものは何かを考え、必死に手を動かしました。

**他にも、GitHubの機能をしっかりと活用し、「issueを確認 -> branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」といったチーム開発の流れを疑似的に再現するなど、より実践的な環境で作業を進めました。**

## 3分でわかる「Ramen Quest」

お忙しい方向けに、サービスの全体像が3分でわかるように動画でまとめました。少しでも雰囲気が伝われば幸いです。

[動画リンク](https://youtu.be/H6Vv5fqODRA )

[![](https://img.youtube.com/vi/H6Vv5fqODRA/0.jpg)](https://www.youtube.com/watch?v=H6Vv5fqODRA)

**※BGMが流れますので、再生する際は周囲にご注意ください。**

# URL

[https://ramen-quest.herokuapp.com/](https://ramen-quest.herokuapp.com/)

```HTML
テストユーザーアカウント

メールアドレス：test@example.com
パスワード：12341234
```

※ページ内には「簡単ログイン（テストユーザーとしてワンクリックでログインができる機能）」も実装してありますので、そちらをご利用いただけると幸いです。

# 開発環境

- Ruby 2.6.3
- Rails 5.2.4

# 各種機能＆導入技術

- プラットフォーム（Heroku、AWS ElasticBeanstalk）
- データベース（MySQL）
- テスト（Rspec、Capybara、factory_bot）
- 自動テスト＆自動デプロイ（Circleci）
- CSSフレームワーク（Bootstrap4）
- コードチェック（rubocop、rails_best_practices、bullet）
- セキュリティチェック（brakeman、rack-attack）
- ユーザー登録＆ログイン（sorcery
- 画像アップロード（carrierwave、mini_magick、 AWS S3、 fog）
- レビュー（jquery.raty）
- カレンダー（simple_calendar）
- いいね、ブックマーク（Ajax）
- チャート(chartkick)
- エディタ（medium-editor）
- マークダウン（redcarpet）
- パーシャル（cells）
- ページネーション（kaminari）
- メールアクティベーション、パスワードリセット（ActionMailer）
- 検索（ransack）
- マップ（geocoder、gmaps4rails）
- パンくずリスト（gretel）
- SEO対策（google-analytics-rails、meta-tags、sitemap_generator）
- 管理者ページ（AdminLTE）
- 通知機能（exception_notification、slack-notifier）
- 各種API（Twitter、Facebook、LINE、Google）

# ER図

![RamenQuest ER図](https://user-images.githubusercontent.com/51913879/74673144-066d8e00-51f2-11ea-8bbe-1aa44c02d69c.png)
