class Person < ApplicationRecord
  has_many :person_clinics, dependent: :destroy
  has_many :clinics, through: :person_clinics
  
  validates :name, presence: true
  validates :hprId, presence: true
  validates_length_of :hprId, minimum: 7, maximum: 8

  def self.search(search)
    if search
      Person.where(
        Person.arel_table[:name]
          .lower
          .matches("%#{search.downcase}%")
          
      )
      .order("name ASC")
    else
      Person.all
    end
  end
end
