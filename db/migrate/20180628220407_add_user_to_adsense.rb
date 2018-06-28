class AddUserToAdsense < ActiveRecord::Migration[5.1]
  def change
    add_column :adsenses, :user_id, :integer
  end
end
