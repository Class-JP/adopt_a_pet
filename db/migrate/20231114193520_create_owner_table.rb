class CreateOwnerTable < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.float :age

      t.timestamps
    end
  end
end
