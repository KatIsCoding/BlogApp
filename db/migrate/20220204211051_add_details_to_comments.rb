class AddDetailsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :text, :text
    add_column :comments, :updatedat, :datetime
    add_column :comments, :createdat, :datetime
  end
end
