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
    fill_in 'Nome', with: 'Rio de Janeiro'
    fill_in 'Descricao', with: 'Galpao do RJ'
    fill_in 'Codigo', with: 'RIO'
    click_on 'Enviar'

    expect(page).to have_content 'Galpao nao cadastrado!'
  end
end
