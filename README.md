## usersテーブル

| Column              | Type                 | options                   |
|---------------------|----------------------|---------------------------|
| last_name           | string               | null: false               |
| first_name          | string               | null: false               |
| last_kana           | string               | null: false               |
| first_kana          | string               | null: false               |
| nickname            | string               | null: false               |
| birth_date          | date                 | null: false               |
| encrypted_password  | string               | null: false               |
| email               | string               | null: false, unique: true |

### Association
* has_many :items
* has_many :records

## itemsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| name                | string               | null: false                   |
| explanation         | text                 | null: false                   |
| category_id         | integer              | null: false                   |
| condition_id        | integer              | null: false                   |
| area_id             | integer              | null: false                   |
| delivery_charge_id  | integer              | null: false                   |
| number_id           | integer              | null: false                   |
| price               | integer              | null: false                   |
| user                | references           | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :record

## ordersテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| post_code           | string               | null: false                   |
| area_id             | integer              | null: false                   |
| city                | string               | null: false                   |
| address             | string               | null: false                   |
| tel                 | string               | null: false                   |
| building            | string               |                               | 
| record              | references           | null: false, foreign_key: true|
### Association
- belongs_to :record

## recordsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| user                | references           | null: false, foreign_key: true|
| item                | references           | null: false, foreign_key: true|

- belongs_to :item
- belongs_to :user
- has_one :order