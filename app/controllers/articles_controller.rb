class ArticlesController < ApplicationController

  def index
    @articles = Article.limit(6)
  end

  def show
  end

end
