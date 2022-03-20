class PersonClinic < ApplicationRecord
  belongs_to :person
  belongs_to :clinic

  validates :clinic_id, presence: true, allow_blank: false
  # validates :clinic_id, inclusion: { 
  #   in: Clinic.all.map{|clinic| clinic.id}, 
  #   allow_blank: false 
  # }
end
