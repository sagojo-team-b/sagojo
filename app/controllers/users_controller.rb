class UsersController < ApplicationController
  before_action :set_variables, only: [:edit]

  def terms_of_service
  end

  def privacy_policy
  end

  def edit
    # 仮情報
    @article = Article.find(1)
  end

  def update
    @profile = Profile.update(params[:id])
  end

  private

  def set_variables
    @profile = current_user.profile
  end

end
