# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

# users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| password_confirm | string | null: false |
| family_name_kanji| string | null: false |
| first_name_kanji | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :orders
- has_many :items

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| user                 | references | null: false |
| name                 | string     | null: false |
| description          | string     | null: false |
| category_id          | integer    | null: false |
| condition_id         | integer    | null: false |
| shipping_fee_id      | integer    | null: false |
| ship_from_address_id | integer    | null: false |
| shipping_days_id     | integer    | null: false |
| price                | integer    | null: false |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- has_one :delivery_address 
- belongs_to :user
- belongs_to :item


## delivery_addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| order            | references | null: false |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| detail_address   | string     | null: false |
| building_name    | string     |             |
| phone_number     | string     | null: false |


### Association

- belongs_to :order


## likes テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_id          | references | null: false |
| user_id          | references | null: false |

### Association

- belongs_to :user
- belongs_to :item


## comments テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_id          | references | null: false |
| user_id          | references | null: false |
| text             | string     | null: false |



### Association

- belongs_to :user
- belongs_to :item