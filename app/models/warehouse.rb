class Warehouse < ApplicationRecord
  validates :name, :code, :city, :description, :address, :zip_code, :area, presence: true
end
