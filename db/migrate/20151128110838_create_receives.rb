class CreateReceives < ActiveRecord::Migration
  def change
    create_table :receives do |t|
      t.references :request
      t.integer :receive_user_id

      t.timestamps null: false
    end
  end
end
