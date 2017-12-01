require 'date'

def visit_property_1
  visit('/')
  click_on 'Rental1'
end

def post_a_rental_from_home
  visit('/')
  click_on 'Post a rental home'
end

def sign_up_from_home
  visit('/')
  click_on 'Sign up'
end

def sign_in_from_home
  visit('/')
  click_on 'Sign in'
end

def sign_up
  sign_up_from_home
  complete_sign_up
end

def sign_in(email = 'test@test.test', pass = 'test')
  click_link 'Sign in'
  fill_in 'email', :with => email
  fill_in 'password', :with => pass
  click_on 'Submit!'
end

def sign_out
  click_on 'Sign out'
end

def sign_up_and_sign_out
  sign_up
  sign_out
end

def sign_up_and_sign_in
  sign_up_and_sign_out
  sign_in
end

def test_book(date)
  visit_property_1
  fill_in 'startdate', :with => date
  fill_in 'enddate', :with => date
  click_on 'Book!'
end

def complete_sign_up(email = 'test@test.test', pass = 'test')
  fill_in 'email', :with => email
  fill_in 'password', :with => pass
  fill_in 'password_confirmation', :with => pass
  click_on 'Submit!'
end
