class BadgesController < ApplicationController
  def index
    render json: Badge.all
  end
end
