class Animal < ApplicationRecord
  # Punto numero 1
  validates_presence_of :age
  validates_presence_of :color
  validates_presence_of :weight
  validates_presence_of :species

  # Punto numero 2
  has_many :pets

  # Punto numero 3
  scope :dogs_only, -> { where(species: 'dog') }
  scope :cats_only, -> { where(species: 'cat') }
end
