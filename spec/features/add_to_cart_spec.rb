require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

   # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end  

  scenario "They add a product and their cart increase by one" do # like it...do block 
    # ACT
    visit root_path
    # DEBUG
    first(".btn-primary").click
    expect(page).to have_text 'My Cart (1)'
    save_and_open_screenshot
     # VERIFY
    expect(page).to have_css 'article.product'
  end
end

