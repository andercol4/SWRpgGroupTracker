class Responsibility < ApplicationRecord
  belongs_to :character

  TYPES = ['Obligation', 'Duty', 'Morality']

  validates :type, inclusion: {in: Responsibility::TYPES}

  validates :name,
    :description,
    presence: true

  validates :score,
    numericality: {greater_than_or_equal_to: 0, only_integer: true}

end
