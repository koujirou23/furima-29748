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

| Column       | Type       | Options           |
| ------------ | -------    | ----------------- |
| name         | string     | null: false       |
| text         | text       | null: false       |
| category     | integer    | null: false       |
| status       | integer    | null: false       |
| delivery_fee | integer    | null: false       |
| area         | integer    | null: false       |
| days         | integer    | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :users
- has_one    :purchases

## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| payment    | integer    | null: false                    |
| postcode   | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| road       | string     | null: false                    |
| bulding    | string     | null: false                    |
| phone      | integer    | null: false                    |

### Association

- has_one  :purchases

## purchases テーブル

| Column     | Type          | Options                        |
| ---------- | ------------- | ------------------------------ |
| user       | references    | foreign_key: true              |
| addresses  | references    | foreign_key: true              |
| item       | references    | foreign_key: true              |

### Association

- has_one    :addreses
- has_one    :item
- belongs_to :user