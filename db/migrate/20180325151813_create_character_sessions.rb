class CreateCharacterSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :character_sessions do |t|
      t.references :character, foreign_key: true
      t.references :session, foreign_key: true
      t.integer :experience_earned

      t.timestamps
    end
  end
end
