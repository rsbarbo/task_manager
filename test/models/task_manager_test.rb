require_relative "../test_helper"


class TaskManagerTest < Minitest::Test
  include TestHelpers

  def current_task_id
    task_manager.all.last.id
  end

  def test_task_is_created
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })

      task = task_manager.find(current_task_id)

      assert_equal "Some title", task.title
      assert_equal current_task_id, task.id
      assert_equal "Some description", task.description
  end

  def test_it_returns_all_tasks
    assert_equal(0, task_manager.all.count)
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
      assert_equal(1, task_manager.all.count)
      assert_instance_of(Task, task_manager.all.first)
  end

  def test_it_finds_a_task
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
      task = task_manager.find(current_task_id)
      assert_instance_of(Task, task_manager.all.first)
  end

  def test_it_deletes_a_task
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
      assert_equal(1, task_manager.all.count)
      task_manager.destroy(current_task_id)
      assert_equal(0, task_manager.all.count)
  end

  def test_it_updates_a_task
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })

      assert_equal(1, task_manager.all.count)

      params = {task: {title: "My new title", description: "Yessss"}}
      task_manager.update(current_task_id, params[:task])

      task = task_manager.find(current_task_id)
      refute_equal("something", task.title)
      assert_equal("My new title", task.title)
      assert_equal("Yessss", task.description)
  end

end
