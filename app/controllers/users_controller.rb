class UsersController < ApplicationController
  def sign_in
    @user = User.new
  end

  def login
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.authenticate_by_username(username, password)

    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      @user = User.new
      render :action => "sign_in"
    end
  end

	def new
    @user = User.new
  end

  def register
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      @user = User.new
      render :action => "new"
   	end
	end

  def sign_out
    session[:user_id] = nil
    redirect_to :root
  end

  private

	def user_params
    puts "lol"
  	params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
