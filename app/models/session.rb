class Session < ApplicationRecord

  belongs_to :campaign

  has_many :character_sessions, dependent: :destroy
  has_many :characters, through: :character_sessions
  has_many :duties, through: :characters
  has_many :obligations, through: :characters
  has_many :moralities, through: :characters
end
