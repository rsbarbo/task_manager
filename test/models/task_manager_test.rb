require_relative "../test_helper"


class TaskManagerTest < Minitest::Test

  def test_it_creates_a_task
    task = TaskManager.new.find(database)
    assert_equal("some title", task.title)
    assert_equal(1, task.id)
    assert_equal("some description", task.description)
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end

end
