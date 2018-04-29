class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :destroy, :update, :show]

  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Your shit was successfully created"
      redirect_to article_path (@article)
    else
      render 'new'
    end
    
  def destroy
    @article.destroy
    flash[:danger] = "Your shit was DESTROYED!"
    redirect_to articles_path
  end
    
  def edit
  
  end
  
  def update
    if @article.update(article_params)
    flash[:success] = "Your shit was successfully updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end
  
  def show
  
  end
end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
  end