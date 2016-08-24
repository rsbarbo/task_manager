require "yaml/store"

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
      database.execute("INSERT INTO tasks
                        (title, description)
                        VALUES
                        ('#{task[:title]}', '#{task[:description]}');"
                      )
    # database.transaction do
      # database["tasks"] ||= []
      # database["total"] ||= 0
      # database["total"] += 1
      # database["tasks"] << { "id" => database["total"], "title" => task[:title], "description" => task[:description] }
    # end
  end

  def raw_tasks
    database.execute("SELECT * FROM tasks;")
    # database.transaction do
    #   database["tasks"] || []
    # end
  end

  def all
    raw_tasks.map { |data| Task.new(data) }
  end

  def raw_task(id)
    database.execute("SELECT * FROM tasks WHERE id =#{id};").first
    # raw_tasks.find { |task| task["id"] == id }
  end

  def find(id)
    Task.new(raw_task(id))
  end

  def update(id, task_data)
    database.execute("UPDATE tasks SET title = '#{task_data[:title]}',
                      description = '#{task_data[:description]}'
                      WHERE id=?",id).first
    # database.transaction do
    #   task = database["tasks"].find { |data| data["id"] == id}
    #   task["title"] = task_data[:title]
    #   task["description"] = task_data[:description]
    # end
  end

  def destroy(id)
    database.execute("DELETE FROM tasks WHERE id ='#{id}';")
    # database.transaction do
    #   database["tasks"].delete_if {|task| task["id"] == id}
    # end
  end

  def delete_all
    database.execute("DELETE FROM tasks;")
    # database.transaction do
      # database["tasks"] = []
      # database["total"] = 0
    # end
  end

end
