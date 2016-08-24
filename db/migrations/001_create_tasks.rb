#db/migration/001_create_tasks.rb

require 'sqlite3'

environments = ["test", "development"]

environments.each do |environment|
  database = SQLite3::Database.new("db/task_manager_#{environment}.db")
  database.execute("CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(64),
  description VARCHAR(64)
  );"
  )
  puts "creating tasks table for #{environment}"
end
