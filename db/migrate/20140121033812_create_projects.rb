class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.integer :hit_count, default: 0
      t.integer :like_count, default: 0

      t.timestamps
    end
  end
end
