class Adsense < ApplicationRecord

  mount_uploaders :images, AdsImageUploader
  # serialize :images, JSON
end
