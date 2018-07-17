class CreateJoinTableShareBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :share_books do |t|
      t.integer :taker_id
      t.integer :book_id

      t.timestamps
    end
  end
end
