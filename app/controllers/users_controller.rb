class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @articles = @user.articles
  end

  def edit
  end

  def bulk_archive_articles
    @articles = Article.where(id:(params[:article_ids]))
    Article.archive_articles @articles
  end

  def bulk_publish_articles
    @articles = Article.where(id:(params[:article_ids]))
    Article.publish_articles @articles
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User created successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User updated successfully.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :phone, :gender, :email)
    end
end
