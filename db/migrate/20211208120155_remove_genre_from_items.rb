class RemoveGenreFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :genre, :string
  end
end
