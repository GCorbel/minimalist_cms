class PagesController < InheritedResources::Base

  before_filter :find_page, only: [:show, :edit, :update]

  respond_to :json, only: :update
  respond_to :js, only: [:edit, :new, :create]

  def show
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?
  end

  def create
    page_attributes = params[:page]
    page_attributes.merge!(body: 'New Page')
    @page = Page.create(page_attributes)
    create! do |success, failure|
      success.js do
        render js: "window.location.href = '/#{@page.slug}'"
      end
      failure.js { render :new }
    end
  end

  def update
    update! do |success, failure|
      success.js do
        render js: "window.location.href = '/#{@page.slug}'"
      end
      failure.js { render :edit }
    end
  end

  private

  def find_page
    @page = if params[:id].present?
      Page.find_by_slug(params[:id])
    else
      Page.find_by_home(true)
    end
  end
end
