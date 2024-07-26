class CreateMangas < ActiveRecord::Migration[7.1]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :author
      t.text :description
      t.date :published_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
