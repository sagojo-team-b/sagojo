class HeaderController < ApplicationController

  def home
  end

  def job
    @articles = Article.page(params[:page]).per(10)
    @all_articles = Article.all
    @all_tags = JobTag.all
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

  def category
    @all_articles = Article.all
    @selected_articles_number = JobTag.find(params[:id]).articles
    @selected_articles = JobTag.find(params[:id]).articles.order('created_at DESC').page(params[:page]).per(10)
    @all_tags = JobTag.all
  end

end
