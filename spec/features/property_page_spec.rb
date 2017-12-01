require_relative '../helpers/feature_helpers.rb'

feature 'Property Page', js: true do
  scenario 'Shows address' do
    visit_property_1
    expect(page).to have_content('London')
  end

  scenario 'Shows price' do
    visit_property_1
    expect(page).to have_content('£10')
  end

  scenario 'Shows input for start date' do
    visit_property_1
    expect(page).to have_field("startdate")
  end

  scenario 'Shows input for end date' do
    visit_property_1
    expect(page).to have_field("enddate")
  end

  scenario 'Shows Book! button' do
    visit_property_1
    expect(page).to have_button("Book!")
  end

  scenario 'Books when available' do
    test_book('2019-12-12')
    expect(page).to have_content('Congratulations you have booked')
  end

  # scenario 'Informs that booking was unsuccessful if booked for the requested dates' do
  #   test_book('2019-12-12')
  #   test_book('2019-12-12')
  #   expect(page).to have_content('Was not able to book')
  # end
end
