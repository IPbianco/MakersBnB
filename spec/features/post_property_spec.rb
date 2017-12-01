require_relative '../helpers/feature_helpers.rb'

feature 'Property Page', js: true do
 scenario 'Shows input for address' do
    visit '/rentals/create'
    expect(page).to have_field("address")
  end

  scenario 'Shows input for price' do
    visit '/rentals/create'
    expect(page).to have_field("price")
  end

  scenario 'Shows input for image' do
    visit '/rentals/create'
    expect(page).to have_field("image")
  end

  scenario 'Shows Submit! button' do
    visit '/rentals/create'
    expect(page).to have_button("Submit!")
  end
end
