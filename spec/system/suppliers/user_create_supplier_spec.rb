require 'rails_helper'

describe 'Usuário cadastra um novo fornecedor' do
  it 'a partir do menu' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    expect(page).to have_field('Nome Fantasia')
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Telefone')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
  end

  it 'com sucesso' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    fill_in 'Razão Social', with: 'Dell Brasil'
    fill_in 'Nome Fantasia', with: 'Alienware'
    fill_in 'CNPJ', with: '1234567891011'
    fill_in 'Endereço', with: 'Avenida Dell'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    fill_in 'Email', with: 'dell@dell.com'
    fill_in 'Telefone', with: '1129999999'

    click_on 'Enviar'

    expect(current_path).to eq suppliers_path
    expect(page).to have_content 'Fornecedor cadastrado com sucesso'
    expect(page).to have_content 'Dell Brasil'
    expect(page).to have_content 'Alienware'
    expect(page).to have_content '1234567891011'
  end

  it 'com CNPJ incorreto' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    fill_in 'Razão Social', with: 'Dell Brasil'
    fill_in 'Nome Fantasia', with: 'Alienware'
    fill_in 'CNPJ', with: '1'
    fill_in 'Endereço', with: 'Avenida Dell'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    fill_in 'Email', with: 'dell@dell.com'
    fill_in 'Telefone', with: '1129999999'

    click_on 'Enviar'

    expect(page).to have_content 'CNPJ não possui o tamanho esperado (13 caracteres)'
    expect(page).to have_content 'Fornecedor não cadastrado!'
  end

  it 'com CNPJ duplicado' do
    supplier = Supplier.create!(corporate_name: 'Dell', registration_number: '1111111111111', full_address: 'Rua grande', city: 'São Paulo',
                                state: 'SP', email: 'dell@dell.com', phone: '1129999999', trade_name: 'Alienware')

    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    fill_in 'Razão Social', with: 'Dell Brasil'
    fill_in 'Nome Fantasia', with: 'Alienware'
    fill_in 'CNPJ', with: '1111111111111'
    fill_in 'Endereço', with: 'Avenida Dell'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    fill_in 'Email', with: 'dell@dell.com'
    fill_in 'Telefone', with: '1129999999'
    click_on 'Enviar'

    expect(page).to have_content 'Fornecedor não cadastrado!'
    expect(page).to have_content 'CNPJ já está em uso'
  end

  it 'com CNPJ em branco' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    fill_in 'Razão Social', with: 'Dell Brasil'
    fill_in 'Nome Fantasia', with: 'Alienware'
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: 'Avenida Dell'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    fill_in 'Email', with: 'dell@dell.com'
    fill_in 'Telefone', with: '1129999999'
    click_on 'Enviar'

    expect(page).to have_content 'Fornecedor não cadastrado!'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
  end
end
