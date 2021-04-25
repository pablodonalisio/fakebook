class ProfileController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def edit
    
  end
end
