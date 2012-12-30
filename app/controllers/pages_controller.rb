class PagesController < InheritedResources::Base

  before_filter :find_page, only: [:show, :edit, :update, :publish, :unpublish, :home, :destroy]

  respond_to :json, only: [:update, :publish, :unpublish, :home]
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

  def destroy
    @page.delete
    redirect_to root_url
  end

  def publish
    @page.update_attribute(:draft, false)
    render json: @page
  end

  def unpublish
    @page.update_attribute(:draft, true)
    render json: @page
  end

  def home
    Page.set_home_page(@page)
    render json: @page
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
