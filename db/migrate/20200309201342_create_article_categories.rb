class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      t.string :name
      t.string :code
      t.boolean :is_active
      t.integer :position

      t.timestamps
    end
  end
end
