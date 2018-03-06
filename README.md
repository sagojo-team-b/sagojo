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
|job_type_id|integer|null: false, foreign_key: true|
|Application_end_date|integer|null: false|

### Association
- belongs_to :job-type
- has_many :tags through :tag_articles
- has_many :users through user_articles, through likes



## job_types
|Column|Type|Options|
|------|----|-------|
|type|string|null: false|

### Association
- has_many :articles



## users_articles
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|article_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article



## tags_articles
|Column|Type|Options|
|------|----|-------|
|article_id|references|null: false, foreign_key: true|
|tag_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tag
- belong_to :article



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



## users_groups
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group



## groups
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users through user-groups
- has_many :messages



## profiles
|Column|Type|Options|
|------|----|-------|
|avatar|||
|image|string||
|catch_phrase|string||
|birth|date||
|sex|string|null: false|
|tel|integer||
|address|string||
|present_place|string||
|link|string|string|
|sns_acount|string||
|job_type_tags|string||
|job_type|string||
|language|text||
|job_history|text||
|travel_history|text||
|skill_tags|string||
|skill|text||
|achievement|text||
|income|string||
|prepare_date|string||
|travel_schedule|string||
|travel_content|text||
|self_introduction|text||

### Association
- belongs_to :user

