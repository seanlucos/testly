class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  ## refers to rake routes, for actions to take
#    articles GET    /articles(.:format)          articles#index
#             POST   /articles(.:format)          articles#create
# new_article GET    /articles/new(.:format)      articles#new
# edit_article GET    /articles/:id/edit(.:format) articles#edit
#     article GET    /articles/:id(.:format)      articles#show
#             PATCH  /articles/:id(.:format)      articles#update
#             PUT    /articles/:id(.:format)      articles#update
  ##          DELETE /articles/:id(.:format)      articles#destroy
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    # @article = Article.find(params[:id])
  end
  
  def create
    # render plain: params[:article].inspect
    
    @article = Article.new(article_params)
    # @article.save
    
    # # redirect_to articles_show(@article)   --WRONG
    #   redirect_to article_path(@article)
      
    if @article.save
      # do something
      
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
      
    else
      render 'new'
    end
  end
  
  
  
  def update
    # @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
      
    else
      render 'edit'
    end
    
  end
  
  def show
    # @article = Article.find(params[:id])
  end
  
  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
      
  end
  
  
  ## move code to method !!
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end