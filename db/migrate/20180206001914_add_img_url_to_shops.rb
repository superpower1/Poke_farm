class AddImgUrlToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :img_url, :string
  end
end
