class Session < ApplicationRecord

  belongs_to :campaign

  has_many :character_sessions, dependent: :destroy
  has_many :characters, through: :character_sessions
end
