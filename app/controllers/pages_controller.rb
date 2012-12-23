class PagesController < InheritedResources::Base

  before_filter :find_page

  respond_to :json, only: :update

  def show
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?
  end

  private

  def find_page
    @page = Page.find_by_slug(params[:id])
  end
end
