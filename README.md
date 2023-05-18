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
| name               | string | null: false             |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| name full-width    | string | null: false             |
| Name half-width    | string | null: false             |
| birth              | integer| null: false             |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| price  | integer| null: false |
| text   | text   | null: false |
| detail | string | null: false |
|delivery| string | null: false |
### Association

- belongs_to :user
- has_one    :purchases


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| comment| references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :adresses
## addresses テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
|post code       | string     | null: false, foreign_key: true |
|prefectures     | string     | null: false, foreign_key: true |
|municipalities  | string     | null: false, foreign_key: true |
|house number    | integer    | null: false, foreign_key: true |
|Building name   | string     | null: false, foreign_key: true |
|telephone number| integer    | null: false, foreign_key: true |

### Association

- belongs_to :purchase