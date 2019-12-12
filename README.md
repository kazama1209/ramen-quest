# Ramen Quest

[![CircleCI](https://circleci.com/gh/kazama1209/ramen-quest.svg?style=shield)](https://circleci.com/gh/kazama1209/ramen-quest)

## サービス概要

![ラーメンクエスト トップページ](https://user-images.githubusercontent.com/51913879/70669028-8dfdc480-1cb8-11ea-8b47-6902ce17b9f0.png)

ラーメンほど奥深い食べ物はそうそうありません。お店によって全く異なる顔を見せてくれるラーメンをめぐる日々は、まさに冒険（quest）そのものとだと私は考えています。

「Ramen Quest」は、レビュー、ブックマーク、ランキング、カレンダーなどの機能を活用し、日々のラーメン巡りを効率的に記録するためのWEBサービス。

コツコツと積み重ねた結果を可視化し、それらをユーザー間で情報共有する事でラーメン好きにありがちな「承認欲求（ラーメン通である事に対する誇り）」の実現を目指します。

## アピールポイント

正直な話、一つ一つの機能自体はいたってシンプルなものばかりであり、画期的で面白みのある作品かどうかと問われれば自信はありません。

しかしながら、Rails最大の強みでもある「MVCアーキテクチャ」の概念にひたすら忠実に従い、何よりも基本を意識した構成を心掛けております。

**また、ただ見せるために作ったわけではなく、将来、現実に運用する事となった場合を想定し、そのために必要な技術も多数取り入れています。（細かな導入技術については後述のリストや実際のコードを見ていただけると幸いです。）**

素人なりに、何よりもまずはユーザーの目線に立ち、一つのサービスを運営する上で必要なものは何かを考え、必死に手を動かしました。

## 3分でわかる「Ramen Quest」

お忙しい方向けに、サービスの全体像が3分でわかるように動画でまとめました。少しでも雰囲気が伝われば幸いです。

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
- Cloud9

# 各種機能＆導入技術

- プラットフォーム（Heroku）
- データベース（MySQL）
- テスト（Rspec、Capybara、factory_bot）
- 継続的インテグレーション（Circleci）
- CSSフレームワーク（Bootstrap4）
- コードチェック（rubocop、rails_best_practices、bullet）
- セキュリティチェック（brakeman、rack-attack）
- ユーザー登録＆ログイン（sorcery）※ソーシャルログイン含む
- 画像アップロード（carrierwave、mini_magick、 AWS S3、 fog）
- レビュー（jquery.raty）
- カレンダー（simple_calendar）
- いいね！
- ブックマーク
- エディタ（medium-editor）
- マークダウン（redcarpet）
- パーシャル（cells）
- ページネーション（kaminari）
- メールアクティベーション、パスワードリセット（ActionMailer）
- 検索（ransack）
- マップ（geocoder、gmaps4rails）
- パンくずリスト（gretel）
- SEO対策（meta-tags、sitemap_generator）
- 管理者ページ（AdminLTE）
