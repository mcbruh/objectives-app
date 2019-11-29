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
          expect(page).to have_content 'I made a goal work!'
        end
    end

    feature 'updating a goal' do
      given(:goal) { create(:goal, user:crud_test ) }

      scenario 'it should render edit goal page with existing goal' do
        visit edit_goal_url(goal)
        expect(page).to have_content 'Edit goal'
        expect(find_field('Title').value).to eq goal.title
      end
      
      scenario 'it should show new goal after editing' do
        edit_goal(goal)
        expect(page).to have_content 'Edited goal'
      end
    end
end
