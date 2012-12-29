require 'spec_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  describe :set_home_page do
    let(:page1) { Page.create }
    let(:page2) { Page.create }

    it 'set the page as home page' do
      Page.set_home_page(page1)
      page1.should be_home
      page2.should_not be_home
    end

    it 'can have only one home page' do
      lambda do
        Page.set_home_page(page1)
      end.should change(Page.where(home: true), :count).by(1)

      lambda do
        Page.set_home_page(page2)
      end.should_not change(Page.where(home: true), :count)
    end
  end
end
