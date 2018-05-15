class DecksController < ApplicationController
  before_action :authenticate_user!
  def index
        @user = current_user
  end

  def new
      #sign_out(current_user)
  end
end
