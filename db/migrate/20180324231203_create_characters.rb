class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :player_name
      t.references :campaign, foreign_key: true
      t.string :race
      t.string :class
      t.string :total_experience
      t.timestamps
    end
  end
end
