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

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| surname            | string | null: false             |
| name               | string | null: false             |
| katakana_surname   | string | null: false             |
| katakana_name      | string | null: false             |
| birth              | date   | null: false             |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type       | Options                        |
| ------           | ------     | -----------                    |
| item_name        | string     | null: false                    |
| item_text        | text       | null: false                    |
| category_id      | integer    | null: false                    |
| detail_id        | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| region_id        | integer    | null: false                    | 
| days_to_ship_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column | Type       | Options                      |
| ------ | ---------- | -----------                  |
| user   | references | null: false foreign_key: true|
| item   | references | null: false foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- has_one :adresse
## addresses テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | -----------                    |
|post_code       | string     | null: false, foreign_key: true |
|prefecture_id   | integer    | null: false, foreign_key: true |
|municipalities  | string     | null: false, foreign_key: true |
|house_number    | string     | null: false, foreign_key: true |
|building_name   | string     | foreign_key: true              |
|telephone_number| string     | null: false, foreign_key: true |

### Association

- belongs_to :purchase