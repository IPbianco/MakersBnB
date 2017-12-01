require_relative '../helpers/feature_helpers.rb'

feature 'Home Page', js: true do
  feature 'Header Messages'do 
    scenario 'Shows Mighty Header' do
      visit('/')
      expect(page).to have_content('IgnacioBnb')
    end

    scenario 'Shows Message' do
      visit('/')
      expect(page).to have_content('Find your next vacation venue')
    end

    scenario 'Displays button to post a rental' do
      visit('/')
      expect(page).to have_link_or_button('Post a rental home')
    end
  end

  scenario 'Sign up redirects to sign up page' do
    sign_up_from_home
    path_end = '/users/new'
    expect(page).to have_current_path(/.*#{Regexp.quote(path_end)}/, url: true)
  end

  scenario 'Sign in redirects to sign in page' do
    sign_in_from_home
    path_end = '/users/signin'
    expect(page).to have_current_path(/.*#{Regexp.quote(path_end)}/, url: true)
  end

  scenario 'Post a rental redirects to sign in page if signed out' do
    post_a_rental_from_home
    path_end = '/users/signin'
    expect(page).to have_current_path(/.*#{Regexp.quote(path_end)}/, url: true)
  end

  scenario 'Directs to individual property page' do
    visit_property_1
    path_end = '/rentals/view?id=1'
    expect(page).to have_current_path(/.*#{Regexp.quote(path_end)}/, url: true)
  end
end
