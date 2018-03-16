class UsersController < ApplicationController
  before_action :set_variables, only: [:edit, :update, :show]

  def terms_of_service
  end

  def privacy_policy
  end

  def show
    # 仮情報
    @article = Article.find(1)
  end

  def edit
    # 仮情報
    @article = Article.find(1)
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path
    else
      flash.now[:alert] = "エラーあり"
      render :edit
    end
  end


  private

  def set_variables
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :avatar,
      :background_image,
      :catch_phrase,
      :birth_date_y,
      :birth_date_m,
      :birth_date_d,
      :sex,
      :tel,
      :post_number,
      :address1,
      :address2,
      :address3,
      :address4,
      :present_place,
      :private_link,
      # :pv,
      :sns,
      # :follower,
      :job_type_tags_1,
      # :job_type_tags_2,
      # :job_type_tags_3,
      # :job_type_tags_4,
      :job_type_else,
      :language,
      :job_history,
      :travel_history,
      :skill_tags_1,
      # :skill_tags_2,
      # :skill_tags_3,
      # :skill_tags_4,
      :skill_tags_else,
      :achievement,
      :income,
      :preparation,
      :travel_date,
      :travel_content,
      :self_introduction
    )
  end
end
