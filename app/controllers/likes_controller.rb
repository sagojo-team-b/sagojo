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
    @likes = Like.where(user_id: current_user.id).all
    @articles = @likes.map {|like|
      Article.find(like.article_id)
    }
  end

  private

  def set_variables
    @article = Article.find(params[:article_id])
  end
end
