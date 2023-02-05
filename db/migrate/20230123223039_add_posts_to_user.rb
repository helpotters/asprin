class AddPostsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :post, foreign_key: true, index: true
  end
end
