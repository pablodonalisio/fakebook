class UsersController < ApplicationController
  
  def show
    @profile = current_user.profile
  end
end
