class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.integer :age
      t.references :dog_type, index: true, foreign_key: true
      t.integer :active
      t.integer :hair
      t.integer :bark
      t.integer :tack
      t.integer :tack
      t.text :comment
      t.string :image

      t.timestamps null: false
    end
  end
end
