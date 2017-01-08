class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  
  
  def index
    # @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 5)  ## run rake test >> ensure code not broke
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(cate_params)
    if @category.save
      flash.now[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    
  end
  
  private
  def cate_params
    params.require(:category).permit(:name)
  end
  def require_admin
    if !logged_in?  || (logged_in? and !current_user.admin?)
      flash.now[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
  
end