require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app == Sinatra::Application
set(:show_exceptions, false)

# describe('', {:type => :feature}) do
#   it('processes the user entry to') do
#     visit('/')
#     fill_in('string_one', :with => 'the')
#     fill_in('string_two', :with => 'the cat the dog')
#     click_button('Send')
#     expect(page).to have_content(2)
#   end
# end
