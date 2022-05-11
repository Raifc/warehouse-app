require 'rails_helper'

describe 'Usuario cadastra um novo galpao' do
  it 'a partir da tela inicial' do

    visit root_path
    click_on 'Cadastrar Galpao'

    expect(page).to have_field('Nome')
    expect(page).to have_field('Descricao')
    expect(page).to have_field('Codigo')
    expect(page).to have_field('Endereco')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Area')
  end

  it 'com sucesso' do
    visit root_path
    click_on 'Cadastrar Galpao'
    fill_in 'Nome', with: 'Rio de Janeiro'
    fill_in 'Descricao', with: 'Galpao do RJ'
    fill_in 'Codigo', with: 'RIO'
    fill_in 'Endereco', with: 'Avenida Floriano Peixoto, 1000'
    fill_in 'Cidade', with: 'Rio de Janeiro'
    fill_in 'CEP', with: '20200-000'
    fill_in 'Area', with: '35000'
    click_on 'Enviar'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpao cadastrado com sucesso'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'RIO'
    expect(page).to have_content '35000 m2'
  end

  it 'com dados incorretos' do
    visit root_path

    click_on 'Cadastrar Galpao'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Galpao nao cadastrado!'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Codigo não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Descricao não pode ficar em branco'
    expect(page).to have_content 'Endereco não pode ficar em branco'
    expect(page).to have_content 'CEP não pode ficar em branco'
    expect(page).to have_content 'Area não pode ficar em branco'
  end

  it 'com dados duplicados' do
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Av um, 300',
                                  zip_code: '20000-000', description: 'Galpao do Rio de Janeiro')

    visit root_path
    click_on 'Cadastrar Galpao'
    fill_in 'Nome', with: 'Rio'
    fill_in 'Descricao', with: 'Galpao Duplicado'
    fill_in 'Codigo', with: 'SDU'
    fill_in 'Endereco', with: 'Avenida a, 1000'
    fill_in 'Cidade', with: 'Uberaba'
    fill_in 'CEP', with: '30400-000'
    fill_in 'Area', with: '900000'
    click_on 'Enviar'

    expect(page).to have_content 'Galpao nao cadastrado!'
    expect(page).to have_content 'Codigo já está em uso'
    expect(page).to have_content 'Nome já está em uso'

  end

  it 'com CEP incorreto' do

    visit root_path
    click_on 'Cadastrar Galpao'
    fill_in 'Nome', with: 'Uberlandia'
    fill_in 'Descricao', with: 'Galpao de Udi'
    fill_in 'Codigo', with: 'UDI'
    fill_in 'Endereco', with: 'Avenida Rondon, 110'
    fill_in 'Cidade', with: 'Uberlandia'
    fill_in 'CEP', with: '304000'
    fill_in 'Area', with: '4000'
    click_on 'Enviar'

    expect(page).to have_content 'CEP não é válido'

  end

end
