# Ramen Quest

[![CircleCI](https://circleci.com/gh/kazama1209/ramen-quest.svg?style=shield)](https://circleci.com/gh/kazama1209/ramen-quest)

ラーメンほど奥深い食べ物もそうそうありません。お店によって全く異なる顔を見せてくれるラーメンをめぐる日々は、まさに冒険（quest）そのものとだと私は考えています。

「Ramen Quest」は、レビュー、ブックマーク、ランキング、カレンダーなどの機能を活用し、日々のラーメン巡りを効率的に記録するためのWEBサービスです。コツコツと積み重ねた結果を可視化し、それらをユーザー間で情報共有する事でラーメン好きにありがちな「承認欲求（ラーメン通である事に対する誇り）」の実現を目指します。

**一つ一つの機能自体はいたってシンプルなものばかりですが、何よりもまずはユーザーの目線に立ち、一つのサービスを運営する上で必要な技術は何かを考えて必死に手を動かしました。**

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

- プラットフォーム（heroku）
- データベース（MySQL）
- テスト（Rspec、Capybara、factory_bot）
- 継続的インテグレーション（Circleci）
- CSSフレームワーク（Bootstrap4）
- コードチェック（rubocop、rails_best_practices、bullet）
- セキュリティチェック（brakeman、rack-attack）
- ユーザー登録＆ログイン（sorcery）※ソーシャルログイン含む
- 画像アップロード（carrierwave、mini_magick、 AWS S3、 fog）
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
