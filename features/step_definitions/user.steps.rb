Given(/^I am not registered$/) do
  expect(User.count).to eq(0)
end

When(/^I register$/) do
  visit new_user_registration_path

  fill_in 'Email', with: 'ben@ben.ben'
  fill_in 'Password', with: 'ben@ben.ben'
  fill_in 'Password confirmation', with: 'ben@ben.ben'

  click_button 'Sign up'
end

Then(/^my account is created$/) do
  expect(User.count).to eq(1)
end

Then(/^I am directed to my profile$/) do
  expect(page).to have_content('ben@ben.ben')
end

Given(/^I am registered$/) do
  visit new_user_registration_path

  fill_in 'Email', with: 'ben@ben.ben'
  fill_in 'Password', with: 'ben@ben.ben'
  fill_in 'Password confirmation', with: 'ben@ben.ben'

  click_button 'Sign up'
end

When(/^I add a uniquely named Destination$/) do
  click_button 'Add a Destination'

  fill_in 'Name', with: 'A place'
  click_button 'Create Destination'
end

Then(/^the Destination appears on my Bucket List$/) do
  expect(page).to have_content('A place')
end

Given(/^I have created Destinations$/) do
  click_button 'Add a Destination'
  fill_in 'Name', with: 'Italy'
  click_button 'Create Destination'

  click_button 'Add a Destination'
  fill_in 'Name', with: 'Brazil'
  click_button 'Create Destination'
end

When(/^I view my Bucket List$/) do
  visit user_profile_path
end

Then(/^I see my Destinations in alphabetical order$/) do
  expect(page.all('.destination').map { |e| e.text }).to eq(['Brazil', 'Italy'])
  expect(page.all('.destination').map { |e| e.text }).to_not eq(['Italy', 'Brazil'])
end

When(/^I add a ToDo item to a Destination$/) do
  within "fieldset##{Destination.last.id}" do
    click_button 'Add ToDo'
  end

  fill_in 'Details', with: 'Your mom'
  fill_in 'Location', with: 'London'

  click_button 'Save'
end

Then(/^The ToDo item appears under Destination on the Bucket List$/) do
  within "fieldset##{Destination.last.id}" do
    expect(page).to have_content('Your mom')
  end
end

Then(/^The ToDo item has longitude and latitude$/) do
  @todo = Todo.last
  expect(@todo.latitude).to_not be_nil
  expect(@todo.longitude).to_not be_nil
end

