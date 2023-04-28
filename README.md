## usersテーブル

| Column              | Type                 | Options                  |
|---------------------|----------------------|--------------------------|
| name                | string               | null: false              |
| encrypted_password  | string               | null: false              |
| email               | string               | null: false, unique: true|

### Association
* has_many :items
* has_many :records

## itemsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| image               | string               | null: false                   |
| name                | string               | null: false                   |
| explanation         | text                 | null: false                   |
| category            | string               | null: false                   |
| condition           | string               | null: false                   |
| area                | string               | null: false                   |
| delivery charge     | integer              | null: false                   |
| number              | integer              | null: false                   |
| price               | integer              | null: false                   |
| user_id             | references           | null: false, foreign_key: true|

### Association
- belongs_to :users
- belongs_to :sends
- belongs_to :records

## sendsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| post code           | integer              | null: false                   |
| prefecture          | text                 | null: false                   |
| city                | string               | null: false                   |
| address             | string               | null: false                   |
| tel                 | string               | null: false                   |
| building            | string               | null: false                   |
| item_id             | references           | null: false, foreign_key: true| 
### Association
- belongs_to :items

## recordsテーブル

| Column              | Type                 | Options                       |
|---------------------|----------------------|-------------------------------|
| buyer               | integer              | null: false                   |
| item                | string               | null: false                   |
| user_id             | references           | null: false, foreign_key: true|
| item_id             | references           | null: false, foreign_key: true|

- belongs_to :items
- belongs_to :users 