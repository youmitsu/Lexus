class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :request_user_id
      t.integer :commit_user_id
      t.string :name
      t.datetime :datetime
      t.text :comment

      t.timestamps null: false
    end
  end
end
