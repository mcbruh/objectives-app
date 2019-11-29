module GoalCrudHelper

    def make_goal(title, details)
        visit new_goal_url
        fill_in 'Title', with: 'testing goals'
        fill_in 'Details', with: 'I made a goal work!'
        check 'Private?'
        click_on 'Create new goal!'
    end

    def edit_goal(goal)
        visit edit_goal_url(goal)
        fill_in 'Title', with: 'Edited goal'
        check 'Completed?'
        click_on 'Update goal'
    end

end