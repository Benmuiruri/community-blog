class AddDeleteReferences < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :user
    remove_reference :comments, :user
    remove_reference :likes, :user
    add_reference :posts, :author,  foreign_key: {to_table: :users}
    add_reference :comments, :author,  foreign_key: {to_table: :users}
    add_reference :likes, :author,  foreign_key: {to_table: :users}
  end
end
