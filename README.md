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

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |

### Association

- has_many :houses
- has_many :items


## Houses テーブル

| Column      | Type   | Options |
| ----------- | ------ | ------- |
| name        | string |         |
| entrance    | string |         |
| ldk         | string |         |
| room        | string |         |
| toilet_bath | string |         |
| other       | string |         |
| bag         | string |         |

### Association

- belongs_to :users
- has_one :items


## items テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| name       | string  | null: false |
| genre      | integer | null: false |
| purpose    | integer | null: false |
| bought_day | string  | null: false |
| price      | integer |             |


### Association

- belongs_to :users
- belongs_to :houses