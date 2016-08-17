require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_task_is_created
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
    task = task_manager.find(1)

    assert_equal "Some title", task.title
    assert_equal 1, task.id
    assert_equal "Some description", task.description
  end

end
