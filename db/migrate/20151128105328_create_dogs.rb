class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :profile

      t.timestamps null: false
    end
  end
end
