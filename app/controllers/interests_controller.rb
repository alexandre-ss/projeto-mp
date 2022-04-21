class InterestsController < ApplicationController

    # def create
    #     @interest = Interest.where(user_id: params[:user_id], song_id: params[:song_id]).first
    #     if @interest.nil?
    #         @interest = Interest.new(user_id: params[:user_id], song_id: params[:song_id], opinion: params[:opinion]) 
    #     else 
    #         check_value = params[:opinion] == 0 ? false : true 
    #         @interest.update_attribute(:opinion, check_value) 
    #     end
    #     @interest.save!
    # end


    def create
        @interest = Interest.new(user_id: params[:user_id], song_id: params[:song_id], opinion: params[:opinion]) 
        @interest.save!
    end

    def update 
        @interest = Interest.where(user_id: params[:user_id], song_id: params[:song_id]).first
        value = params[:opinion] == 0 ? false : true 
        @interest.update_attribute(:opinion, value)
        @interest.save!
    end

end