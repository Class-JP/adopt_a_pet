class CreatePetTable < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :adoption_date

      t.timestamps
    end
  end
end
