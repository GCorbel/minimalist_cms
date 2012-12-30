#encoding=utf-8
require 'spec_helper'
include Capybara::DSL

feature "Page" do
  let!(:home_page) { Page.create(body: 'Welcome', title: 'home') }

  scenario "View a page" do
    visit "/home"
    page.should have_content('Welcome')
  end

  scenario "View the home page" do
    home_page.update_attribute(:home, true)
    visit "/"
    page.should have_content('Welcome')
  end

  scenario "Create a new page", true, js: true do
    visit "/home"
    click_on "Page's actions"
    click_on "Create a page"
    sleep 1
    fill_in("Title", with: "New Page")
    fill_in("Description (SEO)", with: "Description")
    fill_in("Keywords (SEO)", with: "Keywords")
    click_button "Save"
    current_path.should == "/new-page"
    page.should have_content("New Page")
  end

  scenario "Update a page", true, js: true do
    visit "/home"
    click_on "Page's actions"
    click_on "Edit the page"
    sleep 1
    fill_in("Title", with: "New Page")
    fill_in("Description (SEO)", with: "Description")
    fill_in("Keywords (SEO)", with: "Keywords")
    click_button "Save"
    current_path.should == "/new-page"
    page.should have_content("Welcome")
  end

  scenario "Destroy a page", js: true do
    Page.create(body: 'Second Page', title: 'second page')
    visit "/second-page"
    click_on "Page's actions"
    click_on "Delete the page"
    page.driver.browser.switch_to.alert.accept
    current_path.should == "/"
  end
end
