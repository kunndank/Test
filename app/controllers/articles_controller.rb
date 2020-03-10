class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_article, only: [:show]

  def index
      q=params[:q] || {}    
      @q = Article.published.ransack(q)
      articles = @q.result(distinct: true)
      page = params[:page] || 1
      @articles = articles.order(name: :desc).page(page)
  end
  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article created successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    
    def set_article
      @article = Article.find(params[:id])
    end

    
    def article_params
      params.require(:article).permit(:title, :text, :is_active, :article_category_id)
    end
end
