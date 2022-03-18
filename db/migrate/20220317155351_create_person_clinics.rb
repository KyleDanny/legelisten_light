class CreatePersonClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :person_clinics do |t|
      t.references :person, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
