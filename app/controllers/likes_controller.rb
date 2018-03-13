class LikesController < ApplicationController
  before_action :set_variables, only: [:like, :unlike]

  def like
    like = current_user.likes.new(article_id: @article.id)
    like.save!
  end

  def unlike
    like = current_user.likes.find_by(article_id: @article.id)
    like.destroy!
  end

  def show
    @articles = current_user.liking_articles
  end

  private

  def set_variables
    @article = Article.find(params[:article_id])
  end
end
