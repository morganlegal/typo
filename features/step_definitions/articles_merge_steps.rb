#When "I add a new animal" do
#  fills_in 'Name', :with => 'Alligator'
#  selects 'Chordata', :from => 'Phylum'
#  fills_in 'Animal Class', :with => 'Sauropsida'
#  fills_in 'Order', :with => 'Crocodilia'
#  fills_in 'Family', :with => 'Alligatoridae'
#  fills_in 'Genus', :with => 'Alligator'
#  checks 'Lay Eggs'
#  clicks_button 'Create'
#end

Given /^an admin user and a non admin user$/ do
  Factory(:user)
  Factory(:user_admin)
end

And /^I am logged as "(.+)" with password "(.+)"$/ do |login, password|
  debugger
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => password
  debugger
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end