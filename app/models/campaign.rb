class Campaign < ApplicationRecord

  belongs_to :game_master, foreign_key: 'game_master_id', class_name: 'User'

  has_many :characters, dependent: :destroy

  validates :name,
    uniqueness: {scope: :game_master_id},
    presence: true
end
