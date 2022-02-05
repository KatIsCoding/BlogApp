class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :bio, :string
    add_column :users, :updatedat, :datetime
    add_column :users, :createdat, :datetime
    add_column :users, :postscounter, :integer
  end
end
