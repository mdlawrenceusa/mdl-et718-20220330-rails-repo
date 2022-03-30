class CreateTires < ActiveRecord::Migration[5.0]
  def change
    create_table :tires do |t|
      t.string :make
      t.string :model
      t.string :size
      t.text :description

      t.timestamps
    end
  end
end
