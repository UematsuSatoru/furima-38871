## usersテーブル

| Column              | Type                 | options      |
|---------------------|----------------------|--------------|
| last_name           | string               |              |
| first_name          | string               |              |
| furigana_last       | string               |              |
| furigana_first      | string               |              |
| nickname            | string               |              |
| birth_date          | date                 |              |
| encrypted_password  | string               |              |
| email               | string               | unique: true |

### Association
* has_many :items
* has_many :records

## itemsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| name                | string               |                               |
| explanation         | text                 |                               |
| category_id         | integer              |                               |
| condition_id        | integer              |                               |
| area_id             | integer              |                               |
| delivery_charge_id  | integer              |                               |
| number_id           | integer              |                               |
| price               | integer              |                               |
| user                | references           | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :send
- has_one :records

## sendsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| post_code           | string               |                               |
| area_id             | integer              |                               |
| city                | string               |                               |
| address             | string               |                               |
| tel                 | string               |                               |
| building            | string               |                               | 
| records             | references           | null: false, foreign_key: true|
### Association
- belongs_to :record

## recordsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| user                | references           | null: false, foreign_key: true|
| item                | references           | null: false, foreign_key: true|

- belongs_to :item
- belongs_to :user