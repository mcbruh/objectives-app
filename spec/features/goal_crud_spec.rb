require 'rails_helper'

feature 'CRUD actions for goals' do
    given(:crud_test) { create(:new_user) }

    background(:each) do
        log_in_as(crud_test)
    end

    feature 'creating a goal' do
        scenario 'it should render new goal page' do
          visit new_goal_url
          expect(page).to have_content 'Create a new goal!'
        end
      
        scenario 'it should show goal after creating' do
          make_goal('testing goals', 'I made a goal work!')
          expect(page).to redirect_to user_url(crud_test.id)
          expect(page).to have_content, 'I made a goal work!'
        end
      
    end

end
