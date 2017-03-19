class MeetingsController < ApplicationController
  def create
    verifcation_codes = ["123456123456"]

    render json: {"error": "Not signed in"}, status: 418 and return if !user_signed_in?
    render json: {"error": "Invalid verification"}, status: 418 and return unless verifcation_codes.include? params[:verification]

    current_user.meetings.create

    b = Badge.find_by icon: "premier-don"

    current_user.badges << b unless current_user.badges.exists? b

    render json: {"status": "ok"}

  end
end
