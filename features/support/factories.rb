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
    user.login 'is_admin'
    user.password 'is_admin'
    user.email 'is@admin.com'
    user.profile_id 1
    user.name 'is_admin'
    user.state 'active'
  end

  factory :article1, class: Article do |a|
    a.title 'article to merge 1 title'
    a.body 'article to merge 1 body'
    a.extended 'extended content for fun'
    #a.guid { Factory.next(:guid) }
    a.permalink 'article-to-merge-1'
    a.published_at '2005-01-01 02:00:00'
    #a.updated_at { Factory.next(:time) }
    a.user { some_user }
    a.allow_comments true
    a.published true
    a.allow_pings true
  end
  factory :article2, class: Article do |a|
    a.title 'article to merge 2 title'
    a.body 'article to merge 2 body'
    a.extended 'extended content for fun'
    #a.guid { Factory.next(:guid) }
    a.permalink 'article-to-merge-2'
    a.published_at '2005-01-01 02:00:00'
    #a.updated_at { Factory.next(:time) }
    a.user { some_user }
    a.allow_comments true
    a.published true
    a.allow_pings true
  end

  factory :comment do |c|
    c.published true
    c.article { some_article }
    c.text_filter {Factory(:textile)}
    c.author 'Bob Foo'
    c.url 'http://fakeurl.com'
    c.body 'Test <a href="http://fakeurl.co.uk">body</a>'
    c.created_at '2005-01-01 02:00:00'
    c.updated_at '2005-01-01 02:00:00'
    c.published_at '2005-01-01 02:00:00'
    c.guid '12313123123123123'
    c.state 'ham'
  end

end

def some_user
  User.find(:first) || Factory(:user)
end