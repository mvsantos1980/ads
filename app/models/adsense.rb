class Adsense < ApplicationRecord

  mount_uploaders :images, AdsImageUploader
  # belongs_to :user
  belongs_to :category
  # serialize :images, JSON
end
