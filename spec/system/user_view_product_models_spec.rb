require 'rails_helper'

describe 'Usuário vê modelos de produtos' do
  it 'a partir do menu' do
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end

    expect(current_path).to eq product_models_path
  end
  it 'com sucesso' do
    supplier = Supplier.create!(corporate_name: 'Samsung Eletronics', registration_number: '2222222222222', full_address: 'Rua da Samsung', city: 'Curitiba',
                                state: 'PR', email: 'samsung@samsung.com', phone: '999999999', trade_name: 'Samsung')

    ProductModel.create!(name: 'Notebook', weight: '2000', width: '30', height: '25', depth: '20', sku: 'NTBK-3', supplier: supplier)
    ProductModel.create!(name: 'S22', weight: '300', width: '10', height: '5', depth: '4', sku: 'S22+', supplier: supplier)

    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end
    expect(page).to have_content 'Notebook'
    expect(page).to have_content 'NTBK-3'
    expect(page).to have_content 'Samsung'
    expect(page).to have_content 'S22'
    expect(page).to have_content 'S22+'
    expect(page).to have_content 'Samsung'

  end

  it 'e não existem produtos cadastrados' do
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end
    expect(page).to have_content 'Não existem produtos cadastrados!'
  end

end
