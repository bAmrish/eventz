class UsersController < ApplicationController
  
  before_action :require_signin, except: [:new, :create]
  before_action :set_user_from_request, only: [:edit, :update, :destroy]
  before_action :require_current_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    @liked_events = @user.liked_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id      
      redirect_to @user, notice: 'User created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update    
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile is updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session.delete(:user_id)
    redirect_to events_url, status: :see_other, alert: 'Account deleted successfully!'
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user_from_request
    @user = User.find(params[:id])
  end

  def require_current_user
    redirect_to events_url, alert: 'Unauthorized!' unless is_current_user?(@user)
  end
end
