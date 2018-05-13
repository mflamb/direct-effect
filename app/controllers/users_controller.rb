class UsersController < ApplicationController
  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all 
    end 
  end

  def new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        AdminMailer.with(user: @user).new_user_waiting_for_approval.deliver_now
      else 
        render 'new'
      end 
    end
  end

  private

  # Make params acccessible for account creation

  def user_params
    params.require(:user).permit(:organization_id, :name, :email, :password)
  end
end
