class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
		    session[:session_token] = @user.session_token
        flash[:success] = "Welcome back, #{@user.name}!"
        redirect_to @user
    else
        flash.now[:error] = "Invalid email/password combination"
        render "new"
    end  	
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end