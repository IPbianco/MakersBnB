require 'date'

def visit_property_1
  visit('/')
  click_link('Rental1')
end

def post_a_rental_from_home
  visit('/')
  click_link('Post a rental home')
end

def test_book(date)
  visit_property_1
  fill_in 'startdate', :with => date
  fill_in 'enddate', :with => date
  click_button 'Book!'
end
