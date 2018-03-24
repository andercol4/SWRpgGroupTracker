class CreateResponsibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :responsibilities do |t|
      t.string :type
      t.integer :score
      t.string :kind
      t.text :description
      t.references :character
      t.timestamps
    end
  end
end
