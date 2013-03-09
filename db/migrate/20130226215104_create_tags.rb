class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :coords
      t.references :user
      t.references :image

      t.timestamps
    end
    add_index :tags, :user_id
    add_index :tags, :image_id
  end
end
