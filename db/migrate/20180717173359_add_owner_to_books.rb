class AddOwnerToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :owner_id, :integer
  end
end
