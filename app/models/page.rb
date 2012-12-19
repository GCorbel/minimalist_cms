class Page < ActiveRecord::Base
  attr_accessible :title, :body, :path
  translates :title, :body

  Globalize::ActiveRecord::Translation.class_eval do
    attr_accessible :locale
  end
end
