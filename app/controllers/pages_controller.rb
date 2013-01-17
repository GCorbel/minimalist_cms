class PagesController < InheritedResources::Base

  respond_to :json

  def show
    @page = if params[:id].present?
      Page.find_by_slug(params[:id])
    else
      Page.find_by_home(true)
    end
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?
  end
end
