require 'factory_girl'

FactoryGirl.define do

  factory :user do |user|
    user.login 'not_admin'
    user.password 'not_admin'
    user.email 'no@admin.com'
    user.profile_id 2
    user.name 'not_admin'
    user.state 'active'
  end

  factory :user_admin, class: User do |user|
    user.login 'admin'
    user.password 'admin'
    user.email 'ad@min.com'
    user.profile_id 1
    user.name 'admin'
    user.state 'active'
  end

end
