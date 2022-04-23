class DashboardsController < ApplicationController
    before_action :authenticate_user!
    
    def dashboard
      user = User.find(current_user.id)
  
      if user.role == "admin"
        @users = User.all
        @songs = Song.all

      else
        @songs = Song.where(user_id: current_user.id)
      end
    end

end
