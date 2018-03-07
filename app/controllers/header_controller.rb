class HeaderController < ApplicationController

  def home
  end

  def job
    @articles = Article.limit(10)
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
