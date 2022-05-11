require 'rails_helper'

describe 'Usuário edita informações de um fornecedor' do
  it 'A partir da página de detalhes do fornecedor' do
    supplier = Supplier.create!(corporate_name: 'Dell', registration_number: '3333333333333', full_address: 'Rua grande',
                                city: 'São Paulo', state: 'SP', email: 'dell@dell.com', phone: '1129999999', trade_name: 'Alienware')
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Dell'
    click_on 'Editar'

    expect(page).to have_field('Nome Fantasia', with: 'Alienware')
    expect(page).to have_field('Razão Social', with: 'Dell')
    expect(page).to have_field('CNPJ', with: '3333333333333')
    expect(page).to have_field('Telefone', with: '1129999999')
    expect(page).to have_field('Endereço', with: 'Rua grande')
    expect(page).to have_field('Cidade', with: 'São Paulo')
    expect(page).to have_field('Estado', with: 'SP')

  end

  it 'com sucesso' do
    supplier = Supplier.create!(corporate_name: 'Dell', registration_number: '3333333333333', full_address: 'Rua grande',
                                city: 'São Paulo', state: 'SP', email: 'dell@dell.com', phone: '1129999999', trade_name: 'Alienware')

    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Dell'
    click_on 'Editar'

    fill_in 'Razão Social', with: 'Lenovo'
    fill_in 'Nome Fantasia', with: 'Lenovo do Brasil'
    fill_in 'CNPJ', with: '4444444444444'
    fill_in 'Endereço', with: 'Rua da Lenovo'
    fill_in 'Cidade', with: 'Curitiba'
    fill_in 'Estado', with: 'PR'
    fill_in 'Email', with: 'lenovo@lenovo.com'
    fill_in 'Telefone', with: '35554444'

    click_on 'Enviar'

    expect(page).to have_content 'Razão Social : Lenovo'
    expect(page).to have_content 'Nome Fantasia : Lenovo do Brasil'
    expect(page).to have_content 'CNPJ : 4444444444444'
    expect(page).to have_content 'Endereço : Rua da Lenovo'
    expect(page).to have_content 'Cidade : Curitiba'
    expect(page).to have_content 'Estado : PR'
    expect(page).to have_content 'Email : lenovo@lenovo.com'
    expect(page).to have_content 'Telefone : 35554444'
  end

  it 'com dados obrigatorios não preenchidos' do
    supplier = Supplier.create!(corporate_name: 'Dell', registration_number: '3333333333333', full_address: 'Rua grande',
                                city: 'São Paulo', state: 'SP', email: 'dell@dell.com', phone: '1129999999', trade_name: 'Alienware')

    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Dell'
    click_on 'Editar'

    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: 'Rua da Lenovo'
    fill_in 'Cidade', with: 'Curitiba'
    fill_in 'Estado', with: 'PR'
    fill_in 'Email', with: ''
    fill_in 'Telefone', with: '35554444'

    click_on 'Enviar'

    expect(page).to have_content 'Não foi possivel atualizar o fornecedor'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
    expect(page).to have_content 'Email não pode ficar em branco'

  end

  it 'com CNPJ incorreto' do
    supplier = Supplier.create!(corporate_name: 'Dell', registration_number: '3333333333333', full_address: 'Rua grande',
                                city: 'São Paulo', state: 'SP', email: 'dell@dell.com', phone: '1129999999', trade_name: 'Alienware')

    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Dell'
    click_on 'Editar'

    fill_in 'Razão Social', with: 'Lenovo'
    fill_in 'Nome Fantasia', with: 'Lenovo do Brasil'
    fill_in 'CNPJ', with: '4444444444'
    fill_in 'Endereço', with: 'Rua da Lenovo'
    fill_in 'Cidade', with: 'Curitiba'
    fill_in 'Estado', with: 'PR'
    fill_in 'Email', with: 'lenovo@lenovo.com'
    fill_in 'Telefone', with: '35554444'

    click_on 'Enviar'

    expect(page).to have_content 'Não foi possivel atualizar o fornecedor'
    expect(page).to have_content 'CNPJ não possui o tamanho esperado (13 caracteres)'

  end

  it 'com CNPJ já existente' do
    first_supplier = Supplier.create!(corporate_name: 'Dell', registration_number: '3333333333333', full_address: 'Rua grande', city: 'São Paulo',
                                      state: 'SP', email: 'dell@dell.com', phone: '1129999999', trade_name: 'Alienware')
    second_supplier = Supplier.create!(corporate_name: 'Samsung', registration_number: '2222222222222', full_address: 'Rua da Samsung', city: 'Curitiba',
                                       state: 'PR', email: 'samsung@samsung.com', phone: '999999999', trade_name: 'Samsung Eletronics')

    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Dell'
    click_on 'Editar'

    fill_in 'Razão Social', with: 'Lenovo'
    fill_in 'Nome Fantasia', with: 'Lenovo do Brasil'
    fill_in 'CNPJ', with: '2222222222222'
    fill_in 'Endereço', with: 'Rua da Lenovo'
    fill_in 'Cidade', with: 'Curitiba'
    fill_in 'Estado', with: 'PR'
    fill_in 'Email', with: 'lenovo@lenovo.com'
    fill_in 'Telefone', with: '35554444'
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possivel atualizar o fornecedor'
    expect(page).to have_content 'CNPJ já está em uso'
  end

end
