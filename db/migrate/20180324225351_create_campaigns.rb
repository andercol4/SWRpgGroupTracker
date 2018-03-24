class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :game_master_id

      t.timestamps
    end
  end
end
