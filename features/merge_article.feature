Feature: Merge Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to add articles to my blog

  Background:
    Given the blog is set up
    Given an admin user and a non admin user

  Scenario: A non-admin cannot merge two articles
    #Given I am not an admin
    Given I am logged as "noadmin" with password "noadmin"
    And an article with the title "Hello world!"
    And I am on the admin content page
    When I follow "Edit"
    Then I should not see "Merge"

  Scenario: Merged article should contain the text of both previous articles
    #Given I am an admin
    Given I am logged as "admin" with password "admin"
    And an article with the title "Hello world!"
    And an article with the title "Hello mates!"
    And I am on the admin content page
    When I follow "Hello world!"
    Then I should see "Merge"
