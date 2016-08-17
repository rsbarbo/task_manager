require_relative "../test_helper"

class CanCreateNewTaskTest < FeatureTest

  def test_user_can_create_a_new_task
    visit '/'
      click_link 'New Task'
      assert_equal "/tasks/new", current_path
      fill_in("task[title]", :with => 'testing_new_task')
      fill_in("task[description]", :with => 'Testing_something_new')
      click_button "submit"
      save_and_open_page
  end

end
