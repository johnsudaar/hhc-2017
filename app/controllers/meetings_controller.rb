class MeetingsController < ApplicationController
  def create
    verifcation_codes = ["123456123456"]

    render json: {"error": "Not signed in"}, status: 418 and return if !user_signed_in?
    render json: {"error": "Invalid verification"}, status: 418 and return unless verifcation_codes.include? params[:verification]

    current_user.meetings.create

    render json: {"status": "ok"}

  end
end
