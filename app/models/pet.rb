class Pet < ApplicationRecord
  # Punto numero 1
  validates_presence_of :name
  
  # Punto numero 2
  belongs_to :owner
  belongs_to :animal

  # # Punto numero 3
  def days_since_adopted
    
    (DateTime.now - self.adoption_date.to_datetime).to_i
  end

  # # Punto numero 4
  scope :older_than_five, -> { joins(:animal).where("animals.age > ?", 5) }

  # # Punto numero 5
  before_create :default_adoption_date

  # private

  def default_adoption_date
    self.adoption_date = DateTime.now
  end
end
