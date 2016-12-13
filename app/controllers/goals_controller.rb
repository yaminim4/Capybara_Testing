class GoalsController < ApplicationController

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      @goal.user_id = current_user.id
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.user_id == current_user.id && @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to edit_goal_url(@goal)
    end
  end


  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to user_url(goal.user)
  end

  def goal_params
    params.require(:goal).permit(:body)
  end

end
