class RemoveCountFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :count, :integer
  end
end
