class Page < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :title, :body, :home
  translates :title, :body, :slug, :meta_keywords, :meta_description

  Globalize::ActiveRecord::Translation.class_eval do
    attr_accessible :locale
  end

  friendly_id :title, use: [:slugged, :globalize]

  def self.set_home_page(page)
    Page.update_all(home: false)
    page.update_attribute(:home, true)
  end
end
