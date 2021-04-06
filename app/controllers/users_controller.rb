class UsersController < ApplicationController
# GET /signup
  def new
    @user = User.new
  end

  # POST /articles or /articles.json
  # def create
  #   @article = Article.new(article_params)
  #   @article.user = User.first
  #   respond_to do |format|
  #     if @article.save
  #       format.html { redirect_to @article, notice: "Article was successfully created." }
  #       format.json { render :show, status: :created, location: @article }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
end