feature 'Home Page' do

  scenario 'Opening home page' do
    visit('/')
    expect(page).to have_content('IgnacioBnb')
  end

  scenario 'Going to property page' do
    visit('/')
    click_link('1')
    expect(page).to have_content('London')
  end

  scenario 'Going to property page' do
    visit('/rental/view?id=1')
    expect(page).to have_content('London')
  end
end





#
# rental/view?id=1
# #
#

# expect(current_path).to eq '/users'
#

# feature 'Sign up' do
#   scenario 'I can sign up as a user' do
#     expect { sign_up }.to change(User, :count).by(1)
#     expect(page).to have_content('Welcome @King!')
#     expect(User.first.email).to eq 'elvis@gmail.com'
#   end
#
#   scenario 'Requires a matching confirmation password' do
#     expect do
#       sign_up(password_confirmation: 'wrong')
#     end
#       .not_to change(User, :count)
#   end
# end
