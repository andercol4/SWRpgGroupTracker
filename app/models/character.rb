class Character < ApplicationRecord
  belongs_to :campaign


  # I call dependent destroy because these are an STI model
  has_many :responsibilities, dependent: :destroy
  has_many :obligations
  has_many :duties
  has_many :moralities


  has_many :character_sessions, dependent: :destroy
  has_many :sessions, through: :character_sessions


  validates :name,
    :player_name,
    :race,
    :career,
    presence: true

  validates :total_experience,
    numericality: {greater_than_or_equal_to: 0, only_integer: true}
end
