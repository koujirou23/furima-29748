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
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| road          | string     | null: false       |
| bulding       | string     |                   |
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

