# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :schedules
- has_many :locations
- has_many :ratings
- has_many :comments

## Rooms テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| room_name   | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| description | string     |                                |
| start_time  | datetime   |                                |
| end_time    | datetime   |                                |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :schedules
- has_many :locations

## Room_user テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## Schedules テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| room          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
| title         | string     | null: false                    |
| start_time    | datetime   |                                |
| end_time      | datetime   |                                |
| description   | string     |                                |
| cost          | integer    |                                |
| reference_url | string     |                                |
| latitude      | decimal    | precision: 10, scale: 6        |
| longitude     | decimal    | precision: 10, scale: 6        |

### Association

- belongs_to :room
- belongs_to :user
- has_many :comments, as: :commentable
- has_many :schedule_locations, dependent: :destroy
- has_many :locations, through: :schedule_locations

## Locations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| room          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
| title         | string     | null: false                    |
| start_time    | datetime   |                                |
| end_time      | datetime   |                                |
| description   | string     |                                |
| cost          | integer    |                                |
| reference_url | string     |                                |
| latitude      | decimal    | precision: 10, scale: 6        |
| longitude     | decimal    | precision: 10, scale: 6        |

### Association

- has_many :comments, as: :commentable
- belongs_to :room
- belongs_to :user
- has_many :tags, through: :location_tags
- has_many :location_tags
- has_many :schedule_locations, dependent: :destroy
- has_many :schedules, through: :schedule_locations
- has_one :rating

## Schedule_locations テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| schedule | references | null: false, foreign_key: true |
| location | references | null: false, foreign_key: true |

### Association

- belongs_to :schedule
- belongs_to :location

## Location_tags テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| location | references | null: false, foreign_key: true |
| tag      | references | null: false, foreign_key: true |

### Association

- belongs_to :tag
- belongs_to :location

## Tags テーブル

| Column | Type   | Options                        |
| ------ | ------ | ------------------------------ |
| name   | string | null: false, foreign_key: true |

### Association

- has_many :location_tags
- has_many :locations through: :location_tags

## Comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| commentable_type | string     | null: false                    |
| commentable_id   | integer    | null: false                    |
| content          | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :commentable, polymorphic: true

## Ratings テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| location | references | null: false, foreign_key: true |
| rating   | integer    |                                |

### Association

- belongs_to :user
- belongs_to :location
