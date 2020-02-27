class Building < ApplicationRecord

  has_many :offices
  has_many :companies, through: :offices
  has_many :employees, through: :companies

  validates :name, :country, :address, :rent_per_floor, :number_of_floors, presence: true
  # validates :rent_per_floor, :number_of_floors, numericality: { only_integer: true }
  
  

  def avail
    number_of_floors_available.join(', ')
  end

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def total_rent
    self.rent_per_floor * self.total_floors_occupied
  end

  def total_floors_occupied
    total_floors = 0
    self.offices.each do |office|
      total_floors += 1
    end
    return total_floors
    #offices.count
  end

end
