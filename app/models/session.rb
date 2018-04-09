class Session < ApplicationRecord

  belongs_to :campaign

  has_many :character_sessions, dependent: :destroy
  has_many :characters, through: :character_sessions
  has_many :duties, through: :characters
  has_many :obligations, through: :characters
  has_many :moralities, through: :characters

  belongs_to :activated_duty, class_name: 'Duty', foreign_key: 'activated_duty_id', optional: true
  belongs_to :activated_morality, class_name: 'Morality', foreign_key: 'activated_morality_id', optional: true
  belongs_to :activated_obligation, class_name: 'Obligation', foreign_key: 'activated_obligation_id', optional: true

  validates :activated_duty_score,
    :activated_obligation_score,
    :activated_morality_score,
    numericality: {greater_than: 0, less_thanor_equal_to: 100, only_integer: true, allow_nil: true}

end
