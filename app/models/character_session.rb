class CharacterSession < ApplicationRecord
  belongs_to :character
  belongs_to :session

  validates :character,
    uniqueness: {scope: :session, message: 'has already been added'}

end
