class HeaderController < ApplicationController

  def home
  end

  def job
    @articles = Article.page(params[:page]).per(10)
  end

  def triplab
  end

  def newcomer
  end

  def company
  end

  def faq
  end

end
