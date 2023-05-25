class HomeController < ApplicationController
  def index
      if user_signed_in?
        redirect_to '/facebook_user'
      end
  end
end
