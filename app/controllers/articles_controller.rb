class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @tags = Tag.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def tag
    @name = Tag.find(params[:id])
  end

  def search
      @articles = Article.all.search_by_title(params[:search])
  end

end
