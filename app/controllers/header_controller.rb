class HeaderController < ApplicationController

  def home
  end

  def job
    @job_num = Article.all
    if params[:keyword] == "latest"
      @articles = Article.order("created_at DESC").page(params[:page]).per(10)
    else
      @articles = Article.page(params[:page]).per(10)
    end
    respond_to do |format|
      format.html
      format.json
    end
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
