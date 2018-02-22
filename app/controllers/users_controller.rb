class UsersController < ApplicationController



  def new
    @user = User.new
  end

  def create
    new_user = User.new(user_params)
    new_user.save
    session[:user_id] = new_user.id
    redirect_to user_path new_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
  end



  # def login_page
  #   @user=User.new
  #
  #
  # end
  #
  # def authenticate
  #   username = params[:user][:username]
  #   password = params[:user][:password_digest]
  #
  # end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

  end
