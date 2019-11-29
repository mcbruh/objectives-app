require 'rails_helper'

feature 'CRUD actions for goals' do
    given(:new_user) { create(:new_user) }

    background(:each) do
      log_in_as(new_user)
    end

    feature 'creating a goal' do
    
      scenario 'should render new goal page' do
        visit new_goal_url
        expect(page).to have_content 'new goal!'
      end
    
      scenario 'should show goal after creating' do
        make_goal('testing goals', 'I made a goal work!')
        expect(page).to have_content, 'I made a goal work!'
      end
      
    end

end
