class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.references :manga, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :number, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
