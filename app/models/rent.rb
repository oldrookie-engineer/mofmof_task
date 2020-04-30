class Rent < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :comment ,length: {in: 1..140}
end
