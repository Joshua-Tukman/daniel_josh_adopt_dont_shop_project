class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.integer :age
      t.string :sex
      t.boolean :status
      t.timestamps
    end
  end
end
