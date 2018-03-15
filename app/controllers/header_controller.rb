class HeaderController < ApplicationController

  def home
  end

  def job
    @all_articles = Article.all
    @articles = Article.page(params[:page]).per(10)
  end

  def show
    @articles = Article.limit(3)
    @article = Article.find(params[:id])
  end

  def triplab
    @triplab_articles = TriplabArticle.page(params[:page]).per(10)
  end

  def newcomer
  end

  def company
  end

  def faq
  end

end
