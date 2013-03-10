
Given /^an admin user and a non admin user$/ do
  @not_admin = Factory(:user)
  @admin = Factory(:user_admin)
  """@not_admin = User.create!(
      :login      => 'not_admin',
      :password   => 'not_admin',
      :email      => 'no@admin.com',
      :profile_id => 2,
      :name       => 'not_admin',
      :state      => 'active')
  @admin = User.create!(
      :login      => 'is_admin',
      :password   => 'is_admin',
      :email      => 'is@admin.com',
      :profile_id => 1,
      :name       => 'is_admin',
      :state      => 'active')"""
end

And /^I am logged as "(.+)" with password "(.+)"$/ do |login, password|
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => password
  click_button 'Login'
  debugger
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^a first article$/ do
  @article1 = Factory(:article1)
end

And /^a second article$/ do
  @article2 = Factory(:article2)
end