class Rent < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :comment ,length: {in: 1..140}
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :reject_both_blank,allow_destroy: true

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:route].blank? and attributes[:station_name].blank? and
      attributes[:walk_time].blank?
      !attributes[:route].blank? and attributes[:station_name].blank? and
      attributes[:walk_time].blank?
    else
      attributes[:route].blank? and attributes[:station_name].blank? and
      attributes[:walk_time].blank?
    end
  end
end
