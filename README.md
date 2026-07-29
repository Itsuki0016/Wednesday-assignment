
# Wednesday-assignment

## 環境構築

### 1. リポジトリをクローン

```bash
git clone git@github.com:Itsuki0016/Wednesday-assignment.git
```

---

### 2. screenを起動

ホームディレクトリで以下を実行します。

```bash
screen
```

screenがインストールされていない場合は、以下を参考にしてください。

https://qiita.com/Chi_corp_123/items/db23df2b6510533b6d43

---

### 3. screenを2つ作成
::::::
以下のキーを押して、新しいscreenを作成します。

```text
Ctrl + A → C
```

1つ目のscreenではDockerを起動します。

```bash
docker compose up
```

もう1つのscreenは作業用として使用します。

---

## データベースの初期設定

### 1. MySQLコンテナへ接続

```bash
docker compose exec mysql mysql example_db
```

---

### 2. access_logsテーブルの作成

```sql
CREATE TABLE access_logs (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(45) NOT NULL,
    user_agent TEXT NOT NULL,
    accessed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

---

### 3. postsテーブルの作成

```sql
CREATE TABLE posts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    image_filename VARCHAR(255) DEFAULT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

---

### 4. テーブル作成の確認

```sql
SHOW TABLES;

DESCRIBE access_logs;

DESCRIBE posts;
```

#### access_logs

```text
+-------------+-------------+------+-----+-------------------+-------------------+
| Field       | Type        | Null | Key | Default           | Extra             |
+-------------+-------------+------+-----+-------------------+-------------------+
| id          | int         | NO   | PRI | NULL              | auto_increment    |
| ip_address  | varchar(45) | NO   |     | NULL              |                   |
| user_agent  | text        | NO   |     | NULL              |                   |
| accessed_at | datetime    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-------------+-------------+------+-----+-------------------+-------------------+
```

#### posts

```text
+----------------+--------------+------+-----+-------------------+-------------------+
| Field          | Type         | Null | Key | Default           | Extra             |
+----------------+--------------+------+-----+-------------------+-------------------+
| id             | int unsigned | NO   | PRI | NULL              | auto_increment    |
| name           | varchar(255) | NO   |     |                   |                   |
| body           | text         | NO   |     | NULL              |                   |
| image_filename | varchar(255) | YES  |     | NULL              |                   |
| created_at     | datetime     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+----------------+--------------+------+-----+-------------------+-------------------+
```

---

### 5. データの確認

#### アクセスログの確認

```sql
SELECT * FROM access_logs ORDER BY id DESC;
```

#### 投稿一覧の確認

```sql
SELECT * FROM posts ORDER BY id DESC;
```

---

## アプリケーションへのアクセス

ブラウザで以下のURLへアクセスしてください。

```
http://<EC2のパブリックIP>/posts.php
```

