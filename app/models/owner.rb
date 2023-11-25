class Owner < ApplicationRecord
  # Punto numero 1
  validates :age, presence: true
  validates :name, presence: true
  validates :email, presence: true

  # Punto numero 2
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_uniqueness_of :email

  # Punto numero 3
  has_many :pets
  accepts_nested_attributes_for :pets

  # Punto numero 4
  def pets_adopted_count
    owner_pets = self.pets

    owner_pets.count
  end

  def pets_names
    owner_pets = self.pets

    pets_names = owner_pets.map { |pet| pet.name }

    pets_names.join(', ')
  end
end
