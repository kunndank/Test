class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.string :state
      t.boolean :is_active
      t.integer :article_category_id

      t.timestamps
    end
  end
end
