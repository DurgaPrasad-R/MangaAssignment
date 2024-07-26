class AddCoverImageToMangas < ActiveRecord::Migration[7.1]
  def change
    add_column :mangas, :cover_image, :string
  end
end
