class Clinic < ApplicationRecord
  has_many :person_clinics, dependent: :destroy
  has_many :people, through: :person_clinics
end
