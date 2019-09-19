# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
    Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_02', content: 'samplesample')
  
    visit tasks_path
  
    # Place it where you want to check the actual situation.
    # In the case of the example, to check "What happens if you go to the task list page after the task is saved"
    # Save_and_open_page is placed immediately after visit tasks_path
    save_and_open_page
  
    expect(page).to have_content 'Incorrect content 1'
    expect(page).to have_content 'Incorrect content 2'
  end
  scenario "Test task creation" do

  end

  scenario "Test task details" do

  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    # Write test content here
  end
end