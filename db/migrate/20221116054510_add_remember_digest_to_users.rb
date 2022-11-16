class AddRememberDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :remember_digest, :string
    add_column :users, :timestamp, :datetime
  end
end
