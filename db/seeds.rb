# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Owner.create(name: 'Owner', email: 'owner@owner.io', age: 39)
Animal.create(age: 3, color: 'gray', weight: '2 kg', species: 'cat')
Animal.create(age: 5, color: 'brown', weight: '180 kg', species: 'horse')
Pet.create(name: 'Kiko', owner_id: Owner.last.id, animal_id: Animal.last.id)
Pet.create(name: 'Kiko', owner_id: Owner.last.id, animal_id: Animal.first.id)