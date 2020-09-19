# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------  | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| name         | string  | null: false |
| name_reading | string  | null: false |
| birthday     | date    | null: false |

### Association

- has_many :items
- has_many :coments

## items テーブル

| Column       | Type       | Options           |
| ------------ | -------    | ----------------- |
| image        | string     | null: false       |
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

- belongs_to :coments
- belongs_to :users
- belongs_to :purchases

## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| payment    | integer    | null: false                    |
| postcode   | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| road       | string     | null: false                    |
| bulding    | string     | null: false                    |
| phone      | integer    | null: false                    |
| user       | references | foreign_key: true              |
| item       | references | foreign_key: true              |

### Association

- has_many :items
- has_one  :addresses

## addresses テーブル

| Column     | Type          | Options                        |
| ---------- | ------------- | ------------------------------ |
| user       | references    | foreign_key: true              |
| purchases  | references    | foreign_key: true              |

### Association

- has_one :purchases