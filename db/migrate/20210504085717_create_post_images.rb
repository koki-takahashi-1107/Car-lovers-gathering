class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :title
      t.text :description
      t.string :image_id

      t.timestamps
    end
  end
end
