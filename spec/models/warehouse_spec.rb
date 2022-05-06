require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence'
    it 'false when name is empty' do
      warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Rua', zip_code: '20000-000',
                                city: 'Rio de Janeiro', area: 3000, description: 'Galpao')

      expect(warehouse).not_to be_valid
    end

    it 'false when code is empty' do
      warehouse = Warehouse.new(name: 'RJ', code: '', address: 'Rua', zip_code: '20000-000',
                                city: 'Rio de Janeiro', area: 3000, description: 'Galpao')

      expect(warehouse).not_to be_valid

    end

    it 'false address name is empty' do
      warehouse = Warehouse.new(name: 'RJ', code: 'RIO', address: '', zip_code: '20000-000',
                                city: 'Rio de Janeiro', area: 3000, description: 'Galpao')

      expect(warehouse).not_to be_valid

    end

    it 'false when zip code is empty' do
      warehouse = Warehouse.new(name: 'RJ', code: 'RIO', address: 'Rua', zip_code: '',
                                city: 'Rio de Janeiro', area: 3000, description: 'Galpao')

      expect(warehouse).not_to be_valid

    end

    it 'false when city is empty' do
      warehouse = Warehouse.new(name: 'RJ', code: 'RIO', address: 'Rua', zip_code: '20000-000',
                                city: '', area: 3000, description: 'Galpao')

      expect(warehouse).not_to be_valid

    end

    it 'false when area is empty' do
      warehouse = Warehouse.new(name: 'RJ', code: 'RIO', address: 'Rua', zip_code: '20000-000',
                                city: 'Rio de Janeiro', area: '', description: 'Galpao')

      expect(warehouse).not_to be_valid

    end

    it 'false when description is empty' do
      warehouse = Warehouse.new(name: 'RJ', code: 'RIO', address: 'Rua', zip_code: '20000-000',
                                city: 'Rio de Janeiro', area: 10000, description: '')

      expect(warehouse).not_to be_valid

    end

  end

  it 'false when code is already in use' do
    first_warehouse = Warehouse.create(name: 'RJ', code: 'RIO', address: 'Rua', zip_code: '20000-000',
                                       city: 'Rio de Janeiro', area: 3000, description: 'Galpao')

    second_warehouse = Warehouse.new(name: 'Porto Alegre', code: 'RIO', address: 'avenida', zip_code: '10000-000',
                                     city: 'Porto Alegre', area: 150000, description: 'Galpao de POA')
    result = second_warehouse.valid?
    expect(result).to eq false
  end

end

