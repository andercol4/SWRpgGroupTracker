class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :summary
      t.references :campaign
      t.integer :activated_duty_id, foreign_key: true
      t.integer :activated_duty_score
      t.integer :activated_morality_id, foreign_key: true
      t.integer :activated_morality_score
      t.integer :activated_obligation_id, foreign_key: true
      t.integer :activated_obligation_score
      t.timestamps
    end
  end
end
