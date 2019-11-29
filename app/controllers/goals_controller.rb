class GoalsController < ApplicationController

    before_action :require_user!

    def new
        @goal = Goal.new
        render :new
    end

    def create
        @goal = current_user.goals.new(goal_params)
        if @goal.save
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def goal_params
        params.require(:goal).permit(:title, :details, :private, :completed)
    end

end
