# frozen_string_literal: true
require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e ve nome da app' do
    visit(root_path)
    expect(page).to have_content('Galpões & Estoque')
  end

  it 'e ve galpoes cadastrados' do
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Av um, 300',
                     zip_code: '20000-000', description: 'Galpao do Rio de Janeiro')
    Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Av Maceio, 100',
                     zip_code: '80000-000', description: 'Galpao de Maceio')

    visit(root_path)

    expect(page).not_to have_content('Nao existem galpoes cadastrados')
    expect(page).to have_content('Rio')
    expect(page).to have_content('Codigo: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000 m2')

    expect(page).to have_content('Maceio')
    expect(page).to have_content('Codigo: MCZ')
    expect(page).to have_content('Cidade: Maceio')
    expect(page).to have_content('50000 m2')
  end

  it 'e nao existem galpoes cadastrados' do
    visit(root_path)
    expect(page).to have_content('Nao existem galpoes cadastrados')
  end
end
