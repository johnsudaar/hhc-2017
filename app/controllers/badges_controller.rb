class BadgesController < ApplicationController
  def index
    render json: Badge.all.sort
  end
end
