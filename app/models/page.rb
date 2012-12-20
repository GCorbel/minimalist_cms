class Page < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :title, :body, :path, :path
  translates :title, :body, :slug

  Globalize::ActiveRecord::Translation.class_eval do
    attr_accessible :locale
  end

  friendly_id :title, use: :slugged
end
