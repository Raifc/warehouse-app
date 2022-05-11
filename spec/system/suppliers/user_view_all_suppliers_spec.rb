require 'rails_helper'

describe 'Usuário vê todos os fornecedores cadastrados' do
  it 'nenhum fornecedor está cadastrado' do
    visit root_path
    click_on 'Fornecedores'

    expect(page).to have_content 'Não existem fornecedores cadastrados!'
  end

  it 'existem fornecedores cadastrados' do
    first_supplier = Supplier.create!(corporate_name: 'Dell', registration_number: '3333333333333', full_address: 'Rua grande', city: 'São Paulo',
                                      state: 'SP', email: 'dell@dell.com', phone: '1129999999', trade_name: 'Alienware')
    second_supplier = Supplier.create!(corporate_name: 'Samsung', registration_number: '2222222222222', full_address: 'Rua da Samsung', city: 'Curitiba',
                                       state: 'PR', email: 'samsung@samsung.com', phone: '999999999', trade_name: 'Samsung Eletronics')

    visit root_path
    click_on 'Fornecedores'
    expect(page).to have_content 'Dell'
    expect(page).to have_content 'Alienware'
    expect(page).to have_content '3333333333333'
    expect(page).to have_content 'Samsung'
    expect(page).to have_content 'Samsung Eletronics'
    expect(page).to have_content '2222222222222'
  end
end