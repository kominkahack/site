# 古民家Hack
シェアハウスを創りたい人のためのサービス

## 各バージョン
- Docker: 18.09.5
- docker-compose: 1.12.0
- ruby: 2.6.3
- rails: 2.5.3
- MySQL: 5.1.10

## Setup
Dockerを使い環境構築をします。
### 1. まず、Dockerをbuildし、MySQLを初期化
```sh
$ docker-compose build
$ docker-compose down
```
### 2. RailsのDBを作成
```sh
$ docker-compose run web rake db:setup
```
### 3. Docker上でRailsを起動
```sh
$ docker-compose up
```
### 4. ブラウザで確認
```
localhost:3000
```

## 開発時
Gemを変更する際は、以下のようにする。
```sh
$ docker-compose exec web bundle install
$ docker-compose build
```
DBをマイグレーションする際は、以下のようにする。
```sh
$ docker-compose exec web rake db:migrate
$ docker-compose down
$ docker-compose up
```
