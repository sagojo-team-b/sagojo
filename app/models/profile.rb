class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  mount_uploader :background_image, BackgroundImageUploader
end
