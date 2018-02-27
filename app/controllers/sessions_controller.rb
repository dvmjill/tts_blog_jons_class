class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    user = User.find_by(username: session_params[:username])
    if user
      if user.authenticate(session_params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:errors] = ["Incorrect username/password"]
        redirect_to new_session_path
      end
    else
      flash[:errors] = ["Incorrect username/password"]
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def session_params
      params.require(:user).permit(:username, :password)
    end

end
