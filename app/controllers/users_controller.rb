class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    id= params[:id]
    @user = User.find(id)
  end

  def update
    id = params[:id]
    @user = User.find(id)
    
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile is updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to events_url, status: :see_other, alert: 'Account deleted successfully!'
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
