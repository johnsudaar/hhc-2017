class UsersController < ApplicationController
  def login
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.authenticate_by_username(username, password)

    if user
      render json: user
    else
      render json: {:error => "Invalid credentials"}, status: 418
    end
  end

  def register
    user = User.new(user_params)
    blood_type = params[:user][:rhesus]
    bt = BloodType.find_or_create_by(:rhesus => params[:user][:rhesus])
    user.blood_type = bt

    if user.valid?
      bt.save
      user.save
      render json: user
    else
      render json: {:error => "Error while processing request"}, status: 418
   	end
	end

  private

	def user_params
  	params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
