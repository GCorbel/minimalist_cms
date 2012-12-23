class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:id])
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?
  end
end
