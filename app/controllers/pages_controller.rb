class PagesController < InheritedResources::Base

  before_filter :find_page

  respond_to :json, only: :update
  respond_to :js, only: :new

  def show
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?
  end

  def new
    @page = Page.new
  end

  def create
    page_attributes = params[:page]
    page_attributes.merge!(body: 'Nouvelle Page')
    @page = Page.create(page_attributes)
    redirect_to "/#{@page.slug}"
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
