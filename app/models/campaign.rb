class Campaign < ApplicationRecord

  belongs_to :game_master, foreign_key: 'game_master_id', class_name: 'User'

  has_many :characters, dependent: :destroy
  has_many :sessions, dependent: :destroy


  validates :name,
    uniqueness: {scope: :game_master_id},
    presence: true

  def current_session
    sessions.find_by(end_date: nil)
  end
end
