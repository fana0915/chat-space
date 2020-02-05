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

# Chatspace DB設計
## usersテーブル

|Column  |Type  |Options    |
|--------|------|-----------|
|username|string|null: false|
|email   |string|null: false|
|passowrd|string|null: false|

### Association
- has_many :messages
- has_many :groups
- has_many  :users,  through:  :groups_users



## messagesテーブル

|Column |Type   |Options                       |
|-------|-------|------------------------------|
|text   |text   |null: false                   |
|image  |text   |null: false                   |
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user



## groupsテーブル

|Column|Type  |Options    |
|------|------|-----------|
|name  |string|null: false|

### Association
- has_many :groups_users
- has_many  :users,  through:  :groups_users
- has_many :messages



## groups_usersテーブル

|Column  |Type   |Options                       |
|--------|-------|------------------------------|
|user_id |integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user