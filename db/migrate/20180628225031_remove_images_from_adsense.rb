class RemoveImagesFromAdsense < ActiveRecord::Migration[5.1]
  def change
    remove_column :adsenses, :images, :string
  end
end
