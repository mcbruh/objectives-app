module GoalCrudHelper

    def make_goal(title, details)
        visit new_goal_url
        fill_in 'Title', with: 'testing goals'
        fill_in 'Details', with: 'I hope this test works'
        check 'Private'
        click_button 'Create new goal!'
    end

end