class CreateJoinTableBooksCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_categories do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps
    end
  end
end
