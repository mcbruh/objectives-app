class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:username], params[:password])
        if user
            session[:user_id] = user.id
            redirect_to user_url(user)
        else
            flash.now[:errors] = user.errors.full_messages
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to new_session_url
    end

end
