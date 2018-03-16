class HeaderController < ApplicationController

  def home
  end

  def job
    @job_num = Article.all
    if params[:keyword] == "latest"
      @articles = Article.order("created_at DESC").page(params[:page]).per(10)
    elsif params[:keyword] == "popular"
      article_ids = Like.group(:article_id).order('count_article_id DESC').count(:article_id).keys
      @liked_articles = article_ids.map { |id| Article.find(id) }
      @articles = Kaminari.paginate_array(@liked_articles).page(params[:page]).per(10)
    elsif params[:keyword] == "wanted"

    elsif params[:keyword] == "finished"
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
