require 'spec_helper'

describe PagesController do
  describe :show do
    it 'should find by slug' do
      Page.should_receive(:find_by_slug).with('test')
      get :show, id: 'test'
    end
  end
end
