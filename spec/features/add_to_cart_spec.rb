require 'rails_helper'

RSpec.feature "User can click 'Add to Cart'", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The cart reflects that the product has been added" do
    # ACT
    visit root_path
    first('article.product').find_button('Add').click
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content 'My Cart (1)'

  end

end