class AddImageUrlsToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :image_urls, :json, array: true, default: []
  end
end
