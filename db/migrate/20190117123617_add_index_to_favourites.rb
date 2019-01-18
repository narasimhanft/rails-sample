class AddIndexToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_index :favourites, [:user_id, :micropost_id], unique: true
  end
end
