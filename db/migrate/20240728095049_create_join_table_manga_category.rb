class CreateJoinTableMangaCategory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :mangas, :categories do |t|
      t.index :manga_id
      t.index :category_id
    end
  end
end
