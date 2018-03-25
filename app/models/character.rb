class Character < ApplicationRecord
  belongs_to :campaign
  has_many :responsibilities, dependent: :destroy

  validates :name,
    :player_name,
    :race,
    :career,
    presence: true

  validates :total_experience,
    numericality: {greater_than_or_equal_to: 0, only_integer: true}
end
