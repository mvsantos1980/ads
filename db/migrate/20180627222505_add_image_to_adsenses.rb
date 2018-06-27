class AddImageToAdsenses < ActiveRecord::Migration[5.1]
  def change
    add_column :adsenses, :images, :string
  end
end
