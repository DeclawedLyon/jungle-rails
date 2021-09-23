class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_confirmation_digest, :string  
  end
end
