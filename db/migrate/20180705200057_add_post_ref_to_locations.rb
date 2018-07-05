class AddPostRefToLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :post, foreign_key: true
  end
end
