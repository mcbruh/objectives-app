require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    scenario 'has a new user page' do
        visit new_user_url
        expect(page).to have_content 'new user'
    end

    feature 'signing up a user' do
        before(:each) do
            visit new_user_url
            fill_in 'username', with: 'test_user'
            fill_in 'password', with: 'good_password'
            click_on 'Create User'
        end
        
        scenario 'shows username on the homepage after signup'

    end
end

feature 'logging in' do
    scenario 'shows username on the homepage after login'

    scenario 'doesn\t show username on the homepage after logout'

end
