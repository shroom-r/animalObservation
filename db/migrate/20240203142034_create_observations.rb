class CreateObservations < ActiveRecord::Migration[7.1]
  def change
    create_table :observations do |t|
      t.string :animalName, null: false
      t.text :description
      t.integer :quantity
      t.date :observationDate, default: -> { 'CURRENT_DATE' }
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
