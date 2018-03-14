class ArticlesController < ApplicationController

  def index
    @articles = Article.limit(6)
    @slider_articles = Article.limit(3)
  end

end
