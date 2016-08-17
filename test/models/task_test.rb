require_relative "../test_helper"

class TaskTest < Minitest::Test

  def test_assigns_attributes_correctly
    task = Task.new({
      "title" => "test title",
      "id" => 1, "description" =>
      "test description"})

    assert_equal("test title", task.title)
    assert_equal(1, task.id)
    assert_equal("test description", task.description)
  end

end
