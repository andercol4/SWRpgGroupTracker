class Character < ApplicationRecord
  belongs_to :campaign
  has_many :responsibilities, dependent: :destroy
end
