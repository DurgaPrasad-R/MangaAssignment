class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :chapter, null: false, foreign_key: true
      t.string :image_url, null: false
      t.integer :order, null: false

      t.timestamps
    end

    add_index :images, [:chapter_id, :order], unique: true
  end
end
