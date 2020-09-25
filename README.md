# Bible

Bible guides you the way to go.

<br>

# Overviw
## You can create and manage your notes.
* Text creation
* Image creation
* Link creation
* You can search for the note you need.

<br>

# Suite URL

<br>

# Test account

<br>

# How to run the test suite
1. Register as a user.
2. Create a new note from the "新規作成" button.
3. Edit your notes as you like.

<br>

# Purpose of bible
* Digitization of notebooks suitable for online learning.
* Collective management of memos, presentation materials, videos, etc.

<br>

# Future plan
* Embedding videos and slides
* Password reset function using email account

<br>

# Database creation

## users table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :notes

<br>

## notes table

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| trash       | boolean |                                |
| user_id     | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

<br>

# How to work locally

* Ruby version 2.6.5
* Rail version 6.0.0
* MySQL version 0.4.4
* Docker

```command
% git clone https://github.com/TatsuyaOkubo/bible.git
% cd bible
% docker-compose up
```
