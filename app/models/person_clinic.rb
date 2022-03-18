class PersonClinic < ApplicationRecord
  belongs_to :person
  belongs_to :clinic
end
