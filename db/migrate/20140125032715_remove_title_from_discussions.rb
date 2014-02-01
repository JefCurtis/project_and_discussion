class RemoveTitleFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :title, :string
  end
end
