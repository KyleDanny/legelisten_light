class PersonClinic < ApplicationRecord
  belongs_to :person
  belongs_to :clinic

  validates :clinic_id, presence: true, allow_blank: false

end
