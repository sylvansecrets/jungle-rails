class UserNames < ActiveRecord::Migration
  def change
    add_column :users, :preferred_name, :string
    add_column :users, :formatted_name, :string
  end
end
