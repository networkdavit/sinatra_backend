require 'sqlite3'

$db = SQLite3::Database.open 'main.db'
$db.execute("CREATE TABLE IF NOT EXISTS posts(title TEXT, posts TEXT)")

$db.execute("INSERT INTO posts(title, posts) VALUES('First post', 'Some content')")

def add_post(title, post)
  $db.execute("INSERT INTO posts(title, posts) VALUES('#{title}', '#{post}')")  
end



