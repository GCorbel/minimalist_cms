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
end
