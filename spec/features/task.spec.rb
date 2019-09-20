
require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
  background do 
  User.create!(email: "g@gmail.com", password: "123456")
  end
 scenario "Test task list" do
  visit  root_path
  fill_in  'Email' ,  with: 'g@gmail.com'
  fill_in  'Password' ,  with: '123456'
  click_on  'Log in'
  expect(page ).to have_text('Logged in as g@gmail.com.')
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on 'Unda Task'
  click_on 'Back'
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_02'
  fill_in  'Content' ,  with: 'sample'
  click_on 'Unda Task'
  click_on 'Back'
  expect(page).to have_content 'testtesttest'
  expect(page).to have_content 'sample'
 end
 scenario "Test task creation" do
  visit  root_path
  fill_in  'Email' ,  with: 'g@gmail.com'
  fill_in  'Password' ,  with: '123456'
  click_on  'Log in'
  expect(page ).to have_text('Logged in as g@gmail.com.')
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on 'Unda Task'
  expect(page ).to have_text('Task was successfully created.')
 end
 scenario "Test task details" do
    visit  root_path
  fill_in  'Email' ,  with: 'g@gmail.com'
  fill_in  'Password' ,  with: '123456'
  click_on  'Log in'
  expect(page ).to have_text('Logged in as g@gmail.com.')
  click_on 'New Task'
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on 'Unda Task'
  click_on 'Back'
  click_on 'Show'
  expect(page).to have_content 'testtesttest'
 end
 scenario "Test whether tasks are arranged in descending order of creation date" do
  task=Task.all
  assert task.order('created_at DESC')

 end
 scenario "Test task updating" do
  visit  root_path
  fill_in  'Email' ,  with: 'g@gmail.com'
  fill_in  'Password' ,  with: '123456'
  click_on  'Log in'
  expect(page ).to have_text('Logged in as g@gmail.com.')
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on 'Unda Task'
  click_on 'Back'
  click_on 'Edit'
  
   fill_in 'Name', with: 'name update'
   fill_in 'Content', with: 'task update'
   click_on 'Sasaisha Task'
   
   expect(page).to have_content('name update')
   expect(page).to have_content('task update')
 end
 scenario 'Test Task Deletion' do
  visit  root_path
  fill_in  'Email' ,  with: 'g@gmail.com'
  fill_in  'Password' ,  with: '123456'
  click_on  'Log in'
  expect(page ).to have_text('Logged in as g@gmail.com.')
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on 'Unda Task'
  click_on 'Back'
  click_on 'Destroy'
   expect(page).to have_text('Task was successfully destroyed.')
 end
end