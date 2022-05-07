require 'rails_helper'

describe 'Usuario deleta um galpao' do
  it 'com sucesso' do
    warehouse = Warehouse.create!(name: 'Brasilia', code: 'BSB', city: 'Brasilia', area: 40_000,
                                  address: 'Av do senado, 300', zip_code: '50000-000', description: 'Galpao de Brasilia')

    visit root_path
    click_on 'Brasilia'
    click_on 'Remover'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpao removido com sucesso'
    expect(page).not_to have_content 'Brasilia'
    expect(page).not_to have_content 'BSB'
  end

  it 'e nao apaga outros galpoes' do

    first_warehouse = Warehouse.create!(name: 'Brasilia', code: 'BSB', city: 'Brasilia', area: 40_000,
                                        address: 'Av do senado, 300', zip_code: '50000-000', description: 'Galpao de Brasilia')

    second_warehouse = Warehouse.create!(name: 'Cuiaba', code: 'CWB', city: 'Cuiaba', area: 44_000,
                                         address: 'Av Cuiaba, 800', zip_code: '20000-000', description: 'Galpao de Cuiaba')

    visit root_path
    click_on 'Brasilia'
    click_on 'Remover'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpao removido com sucesso'
    expect(page).not_to have_content 'Brasilia'
    expect(page).to have_content 'Cuiaba'

  end

end
