module AuthTestHelper

    def log_in_as(user)
        visit new_session_url
        fill_in 'Username', with: user.username
        fill_in 'Password', with: 'good_password'
        click_button 'Log in'
    end

end