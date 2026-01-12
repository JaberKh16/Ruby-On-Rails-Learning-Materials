class UsersController < ApplicationController

  # signup form
  def new
    @user = User.new
    render template: "users/new"
  end

  # create user
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User created successfully."
    else
      render :new
    end
  end


  # show profile
  def show
    @user = User.find(params[:id])
  end


  # list all user
  def index
    @users = User.all
  end

  # edit form
  def edit
    @user = User.find(params[:id])
  end

  # update user
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User updated successfully."
    else
      render :edit
    end
  end

  # delete user
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted successfully."
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_active)
  end
end
