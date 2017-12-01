require_relative '../helpers/feature_helpers.rb'

feature 'Sign up', js: true do
  scenario 'Sign in button disappears after sign up' do
    sign_up
    expect(page).to_not have_selector(:link_or_button, 'Sign in')
  end

  scenario 'Sign out button appears after sign up' do
    sign_up
    expect(page).to have_selector(:link_or_button, 'Sign out')
  end

  scenario 'User is redirected to home page after sign up' do
    sign_up
    path_end = '/'
    expect(page).to have_current_path(/.*#{Regexp.quote(path_end)}/, url: true)
  end
end

feature 'Sign in', js: true do
  scenario 'Sign in button disappears after sign in' do
    sign_up_and_sign_in
    expect(page).to_not have_selector(:link_or_button,'Sign in')
  end

  scenario 'Sign out button appears after sign in' do
    sign_up_and_sign_in
    expect(page).to have_selector(:link_or_button, 'Sign out')
  end

  scenario 'User is redirected to home page after sign in' do
    sign_up_and_sign_in
    path_end = '/'
    expect(page).to have_current_path(/.*#{Regexp.quote(path_end)}/, url: true)
  end
end

feature 'Sign out', js: true do
  scenario 'Sign out button disappears after sign out' do
    sign_up_and_sign_out
    expect(page).to_not have_selector(:link_or_button, 'Sign out')
  end

  scenario 'Sign in button appears after sign out' do
    sign_up_and_sign_out
    expect(page).to have_selector(:link_or_button, 'Sign in')
  end

  scenario 'User is redirected to home page after sign out' do
    sign_up_and_sign_out
    path_end = '/'
    expect(page).to have_current_path(/.*#{Regexp.quote(path_end)}/, url: true)
  end
end
