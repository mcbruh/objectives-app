module GoalCrudHelper

    def make_goal(title, details)
        visit new_goal_url
        fill_in 'Title', with: 'testing goals'
        fill_in 'Details', with: 'I made a goal work!'
        check 'Private?'
        click_on 'Create new goal!'
    end

end