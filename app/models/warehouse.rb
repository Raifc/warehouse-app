class Warehouse < ApplicationRecord
  validates :name, :code, :city, :description, :address, :zip_code, :area, presence: true
  validates :code, uniqueness: true
end
