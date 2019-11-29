require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    scenario 'has a new user page' do
        visit new_user_url
        expect(page).to have_content 'new user'
    end

    feature 'signing up a user' do
        scenario 'shows username on the homepage after signup' do
            sign_up_as('test_user')
            expect(page).to have_content 'Welcome test_user'
        end

    end
end

feature 'logging in' do
    given(:new_user) { create(:new_user) }
    scenario 'shows username on the homepage after login' do
        log_in_as(new_user)
        expect(page).to have_content 'Welcome new_user'
    end
end
 
feature 'logging out' do
    given!(:new_user) { create(:new_user) }
    scenario 'doesn\t show username on the homepage after logout' do
        log_in_as(new_user)
        click_on 'Log out'
        expect(page).to_not have_content 'new_user'
    end
end
