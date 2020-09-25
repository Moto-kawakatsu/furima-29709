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
| birth_year       | integer| null: false |
| birth_month      | integer| null: false |


### Association

- has_many :credit_cards
- has_many :purchase
- has_many :items

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| users            | references | null: false |
| image            | string     | null: false |
| name             | string     | null: false |
| description      | string     | null: false |
| category         | string     | null: false |
| condition        | string     | null: false |
| shipping_fee     | integer    | null: false |
| ship_from_address| string     | null: false |
| shipping_days    | integer    | null: false |
| price            | integer    | null: false |



### Association

- belongs_to :users
- has_one :purchase



## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- has_one :delivery_address 
- has_one :credit_cards
- belongs_to :users
- belongs_to :items


## delivery_address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references | null: false |
| postal_code      | integer    | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| detail_address   | string     | null: false |
| building_name    | string     |             |
| phone_number     | integer    | null: false |


### Association

- belongs_to :purchase


## credit_cards テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| card_number     | integer    | null: false, foreign_key: true |
| expiration_date | integer    | null: false, foreign_key: true |
| CVC             | integer    | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :purchase