class PagesController < ApplicationController

  respond_to :json

  def show
    @page = if params[:id].present?
      Page.find_by_slug(params[:id])
    else
      Page.find_by_home(true)
    end
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?
  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    render json: @page
  end
end
