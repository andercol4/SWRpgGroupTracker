class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :summary
      t.references :campaign
      t.timestamps
    end
  end
end
