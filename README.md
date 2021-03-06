# URL
https://furima-29748.herokuapp.com/

# ID,Pass

ID/Pass  
ID: admin  
Pass: 2222  

# テスト用アカウント等
購入者用  
メールアドレス: tanaka@gmail.com  
パスワード: tanaka123  

# 購入用カード情報
番号：4242424242424242  
期限：01/40  
セキュリティコード：123  

# 出品者用
メールアドレス名: yamada@gmail.com  
パスワード: yamada123  

# 動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。  
接続先およびログイン情報については、上記の通りです。  
同時に複数の方がログインしている場合に、ログインできない可能性があります。  

# 出品方法
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品  
# 購入方法
テストアカウントでログイン→トップページから商品検索→商品選択→商品購入  
確認後、ログアウト処理をお願いします。  







# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_name_reading     | string  | null: false |
| first_name_reading    | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options           |
| --------------- | -------    | ----------------- |
| name            | string     | null: false       |
| text            | text       | null: false       |
| category_id     | integer    | null: false       |
| status_id       | integer    | null: false       |
| delivery_fee_id | integer    | null: false       |
| area_id         | integer    | null: false       |
| day_id          | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## addresses テーブル

| Column        | Type       | Options           |
| ----------    | ---------- | ----------------- |
| postcode      | string     | null: false       |
| area_id       | integer    | null: false       |
| city          | string     | null: false       |
| road          | string     | null: false       |
| building      | string     |                   |
| phone         | string     | null: false       |
| purchase      | references | foreign_key: true |
### Association

- belongs_to :purchase

## purchases テーブル

| Column     | Type          | Options           |
| ---------- | ------------- | ----------------- |
| user       | references    | foreign_key: true |
| item       | references    | foreign_key: true |

### Association

- has_one    :address
- belongs_to :item
- belongs_to :user

