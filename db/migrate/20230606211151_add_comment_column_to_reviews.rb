class AddCommentColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :comment, :text
  end
end
