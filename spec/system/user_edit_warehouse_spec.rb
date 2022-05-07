require 'rails_helper'

describe ' Usuario edita um galpao' do
  it 'a partir da pagina de detalhes' do
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Av um, 300',
                                  zip_code: '20000-000', description: 'Galpao do Rio de Janeiro')

    visit root_path
    click_on 'Rio'
    click_on 'Editar'

    expect(page).to have_content('Editar Galpao')
    expect(page).to have_field('Nome', with: 'Rio')
    expect(page).to have_field('Descricao', with: 'Galpao do Rio de Janeiro')
    expect(page).to have_field('Codigo', with: 'SDU')
    expect(page).to have_field('Endereco', with: 'Av um, 300')
    expect(page).to have_field('Cidade', with: 'Rio de Janeiro')
    expect(page).to have_field('CEP', with: '20000-000')
    expect(page).to have_field('Area', with: '60000')
  end

  it 'com sucesso' do

    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Av um, 300',
                                  zip_code: '20000-000', description: 'Galpao do Rio de Janeiro')

    visit root_path
    click_on 'Rio'
    click_on 'Editar'

    fill_in 'Nome', with: 'Recife'
    fill_in 'Cidade', with: 'Recife'
    fill_in 'Area', with: '9999'
    fill_in 'Endereco', with: 'Rua Recife, 900'
    fill_in 'CEP', with: '80000-000'

    click_on 'Enviar'

    expect(page).to have_content 'Nome: Recife'
    expect(page).to have_content 'Cidade: Recife'
    expect(page).to have_content 'Area: 9999'
    expect(page).to have_content 'Endereco: Rua Recife, 900'
    expect(page).to have_content 'CEP: 80000-000'
    expect(page).to have_content 'Galpao atualizado com sucesso'
  end

  it 'e mantem os campos obrigatorios' do
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Av um, 300',
                                  zip_code: '20000-000', description: 'Galpao do Rio de Janeiro')
    visit root_path
    click_on 'Rio'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Area', with: ''
    fill_in 'Endereco', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Nao foi possivel atualizar o galpao'
  end
end