class ProfileController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to @profile
    else
      flash.now[alert] = "Couldn't edit profile"
      render :edit
    end
  end

  def profile_params
    params.require(:profile).permit(:birthday, :country, :city)
  end

end
