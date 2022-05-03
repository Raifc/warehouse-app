require 'rails_helper'

describe 'Usuario visualiza detalhes de um galpao' do
  it 'deve ver informacoes adicionais' do
    Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos',
                     area: 100000, adress: 'Avenida do Aeroporto, 1000',
                     zip_code: '15000-000', description: 'Galpao de cargas internacionais')
    visit('/')
    click_on('Aeroporto SP')

    expect(page).to have_content('Galpao GRU')
    expect(page).to have_content('Nome: Aeroporto SP')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Area: 100000 m2')
    expect(page).to have_content('Endereco: Avenida do Aeroporto, 1000 CEP: 15000-000')
    expect(page).to have_content('Galpao de cargas internacionais')
  end
end

