## users

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unipue: true|
|magazine|integer|null: false|

### Association
- has_many: articles through user_articles, through likes
- has_many :groups through user_groups
- has_one :profile



## articles

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|image|null: false|
|job-type_id|integer|null: false|
|end-date|integer|null: false|

### Association
- belongs_to :job-type
- has_many :tags through :tag_articles
- has_many :users through user_articles, through likes



## job-types
|Column|Type|Options|
|------|----|-------|
|type|string|null: false|

### Association
- has_many :articles


## user_articles
|Column|Type|Options|
|------|----|-------|
|------|----|-------|


◆user_articles（※中間テーブル）
belongs_to :user
belongs_to :article
（必要なカラム）user-id, article-id
