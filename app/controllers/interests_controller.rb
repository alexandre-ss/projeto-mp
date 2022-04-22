class InterestsController < ApplicationController
    def index 
        @non_interests = Interest.where(user_id: current_user.id, opinion: false)
        @interests = Interest.where(user_id: current_user.id, opinion: true)
    end

    # def create
    #     value = params[:opinion] == 0 ? false : true 
    #     @interest = Interest.new(user_id: params[:user_id], song_id: params[:song_id], opinion: value) 
    #     @interest.save!
    # end


    def create
        @interest = Interest.where(user_id: params[:user_id], song_id: params[:song_id]).first
        if @interest.nil?
            @interest = Interest.new(user_id: params[:user_id], song_id: params[:song_id], opinion: params[:opinion]) 
        else 
            check_value = params[:opinion] == "0" ? false : true 
            @interest.update(user_id: params[:user_id], song_id: params[:song_id], opinion: check_value) 
        end
        @interest.save
        redirect_to index_path
    end

    def edit
    end

    def update 
        @interest = Interest.where(user_id: params[:user_id], song_id: params[:song_id]).first
        value = params[:opinion] == 0 ? false : true 
        @interest.update(user_id: params[:user_id], song_id: params[:song_id], opinion: value) 
        @interest.save
        redirect_to index_path
    end

end
