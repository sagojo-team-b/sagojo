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
|user_id|references|null: false, foreign_key: true|
|article_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article


## tag_articles
|Column|Type|Options|
|------|----|-------|
|article_id|references|null: false, foreign_key: true|
|tag_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tag
- belong_to :article


## tag_articles
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|

### Association
- has_many :articles through :tag_articles


## likes
|Column|Type|Options|
|------|----|-------|
|article_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article

## messages
|Column|Type|Options|
|------|----|-------|
|content|text||
|image|image||
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
