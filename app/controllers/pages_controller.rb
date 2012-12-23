class PagesController < InheritedResources::Base

  before_filter :find_page

  respond_to :json, only: :update

  def show
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?
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
