class Responsibility < ApplicationRecord
  belongs_to :character

  TYPES = ['Obligation', 'Duty', 'Morality']

  validates :type, inclusion: {in: Responsibility::TYPES}

  validates :name,
    :description,
    presence: true

  validates :score,
    numericality: {greater_than_or_equal_to: 0, only_integer: true}


  def range_start(int)
    int + 1
  end

  def range_finish(int)
    range_start(int) + score - 1
  end

  def range(int = 0)
    "#{range_start(int)}-#{range_finish(int)}"
  end

  def self.range_array
    current_total = 0
    score_array = order(score: :desc).map do |responsibility|
      current_total = responsibility.range_finish(current_total)
    end
  end

  def self.select_activated(int = 0)
    activated_index = range_array.index.with_index { |num, i| int <= num && int >= range_array[i - 1] }
    range_array[activated_index]
  end
end
