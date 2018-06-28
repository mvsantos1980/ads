class AddCategoryToAdsense < ActiveRecord::Migration[5.1]
  def change
    add_column :adsenses, :category_id, :integer
  end
end
