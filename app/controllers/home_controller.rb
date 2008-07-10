class HomeController < ApplicationController

  layout "standard"

  def index
    
    @user = current_user
    # might need to add some check to make sure the user is authenticate
    @roles_of_user = current_user.space_roles
  end

end
