class AddDetailsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :createdat, :datetime
    add_column :likes, :updatedat, :datetime
  end
end
