class SessionsController < ApplicationController

  def new
    
  end

  def create
    email = params[:email]
    password = params[:password]
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome Back #{@user.name}!"
    else
      flash.now[:alert] = 'Invalid email or password!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    
  end
end
