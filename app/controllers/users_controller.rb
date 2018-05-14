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

  def edit
    @users = User.where(approved: false)
  end

  def approve_user
    user = User.find(params[:id])
    user.approved = true
    if user.save
      flash[:notice] = "User has been approved"
    else
      flash[:alert] = "User approval failure"
    end
    redirect_to authenticated_admin_root_path
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
    params.require(:user).permit(:organization_id, :first_name, :last_name, :email, :password)
  end
end
