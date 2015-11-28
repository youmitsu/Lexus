class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :postcord, :integer
    add_column :users, :address, :string
    add_column :users, :profile, :text
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
end
