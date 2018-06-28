class AddCollunsToAdsense < ActiveRecord::Migration[5.1]
  def change
    add_column :adsenses, :view, :integer
  end
end
