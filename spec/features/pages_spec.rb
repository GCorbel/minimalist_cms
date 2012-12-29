#encoding=utf-8
require 'spec_helper'
include Capybara::DSL

feature "Page" do
  let!(:page) { Page.create(body: 'Welcome', title: 'home') }

  scenario "View a page" do
    visit "/home"
    page.should have_content('Welcome')
  end

  scenario "View the home page" do
    page.update_attribute(:home, true)
    visit "/"
    page.should have_content('Welcome')
  end

  scenario "Create a new page", true, js: true do
    visit "/home"
    click_on "Ajouter une page"
    sleep 1
    fill_in("Titre", with: "New Page")
    fill_in("Description (SEO)", with: "Description")
    fill_in("Mots clés (SEO)", with: "Keywords")
    click_button "Sauvegarder"
    current_path.should == "/new-page"
    page.should have_content("Nouvelle Page")
  end

  scenario "Update a page", true, js: true do
    visit "/home"
    click_on "Modifier la page"
    sleep 1
    fill_in("Titre", with: "New Page")
    fill_in("Description (SEO)", with: "Description")
    fill_in("Mots clés (SEO)", with: "Keywords")
    click_button "Sauvegarder"
    current_path.should == "/new-page"
    page.should have_content("Welcome")
  end
end
