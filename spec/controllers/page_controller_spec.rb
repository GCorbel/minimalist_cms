require 'spec_helper'

describe PagesController do

  let(:page) { stub_model(Page) }

  describe :show do
    context "when there is a page" do
      it 'should find by slug' do
        Page.should_receive(:find_by_slug).with('test').and_return(page)
        get :show, id: 'test'
      end
    end

    context "when there is no page" do
      it 'raise an exception' do
        lambda {
          get :show, id: 'test'
        }.should raise_error(ActionController::RoutingError)
      end
    end

    context "when the path searched is empty" do
      it 'find the home page' do
        page.update_attribute(:home, true)
        Page.should_receive(:find_by_home).with(true).and_return(page)
        get :show, id: ''
      end
    end
  end
end
