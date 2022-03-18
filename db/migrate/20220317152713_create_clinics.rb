class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :address
      t.integer :contact_number
      t.integer :rating

      t.timestamps
    end
  end
end
