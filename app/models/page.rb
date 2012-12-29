class Page < ActiveRecord::Base
  extend FriendlyId

  validates :title, presence: true, uniqueness: true

  attr_accessible :title, :body, :home, :meta_keywords, :meta_description
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
