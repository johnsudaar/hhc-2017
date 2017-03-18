class IndexController < ApplicationController
  before_filter :authenticate_user!, only: :secret

  def index
    render json: "Salut"
  end

  def secret
  end
end
