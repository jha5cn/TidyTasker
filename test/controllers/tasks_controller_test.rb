require 'test_helper'

class TasksControllerTest < ActionController::TestCase
	tests TasksController
  
  def test_save
	post(:save, task: {id: 3, project_id: 1, title: "testSave", timePoints: 2, description: "testing save", inProgress: false, completed: true, removed: false})
	assert_response :found 
	assert_not_nil Task.find_by(title: "testSave")
  end

end
