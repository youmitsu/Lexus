class CreateDogTypes < ActiveRecord::Migration
  def change
    create_table :dog_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
