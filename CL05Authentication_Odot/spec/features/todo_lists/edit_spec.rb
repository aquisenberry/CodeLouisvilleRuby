require 'spec_helper'


describe "Editing todo lists" do
  before do
    
  end
  let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.") }
  let!(:user){User.create(first_name: "Anthony", last_name: "Quisenberry", email: "anthony.quisenberry@gmail.com", password: "treehouse1", password_confirmation: "treehouse1")}
  
  def update_todo_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is my todo list."
    todo_list = options[:todo_list]


    User.stub(:find_by).and_return(user)
    visit "/todo_lists"
    expect(page).to have_content("asdf")
    within "#todo_list_#{todo_list.id}" do
      click_link "Edit"
    end
    

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Todo list"
  end

  # def log_in 
  #   let!(:user){User.create(first_name: "Anthony", last_name: "Quisenberry", email: "anthony.quisenberry@gmail.com", password: "treehouse1", password_confirmation: "treehouse1")}
  #   visit new_user_session_path
  #   fill_in "Email Address", with: user.email
  #   fill_in "Password", with: user.password
  #   expect(page).to have_content("asdfas")
  # end
  it "updates a todo list successfully with correct information" do
    update_todo_list todo_list: todo_list, 
                     title: "New title", 
                     description: "New description"

    todo_list.reload

    expect(page).to have_content("Todo list was successfully updated")
    expect(todo_list.title).to eq("New title")
    expect(todo_list.description).to eq("New description")
  end

  it "displays an error with no title" do
    update_todo_list todo_list: todo_list, title: ""
    title = todo_list.title
    todo_list.reload
    expect(todo_list.title).to eq(title)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a title" do
    update_todo_list todo_list: todo_list, title: "hi"
    expect(page).to have_content("error")
  end

  it "displays an error with no description" do
    update_todo_list todo_list: todo_list, description: ""
    expect(page).to have_content("error")
  end

  it "displays an error with too short a description" do
    update_todo_list todo_list: todo_list, description: "hi"
    expect(page).to have_content("error")
  end
end