class Company < ApplicationRecord
    has_many :employees
    has_many :offices
end
