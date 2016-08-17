require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest

  def test_user_sees_all_tasks
    task_manager.create({title: "title 1",
      description: "description 1"})
    task_manager.create({title: "title 2",
      description: "description 2",})

      visit '/tasks'
        save_and_open_page
        assert page.has_content?('1: title 1')
        assert page.has_content?('2: title 2')
  end
end
