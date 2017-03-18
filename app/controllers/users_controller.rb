class UsersController < ApplicationController
  def login
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.authenticate_by_username(username, password)

    if user
      render json: user
    else
      render json: {:error => "Invalid credentials"}
    end
  end

  def register
    user = User.new(user_params)

    if user.valid?
      user.save
      render json: user
    else
      render json: {:error => "Error while processing request"}
   	end
	end

  private

	def user_params
  	params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
