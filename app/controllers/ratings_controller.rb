class RatingsController < ApplicationController
  before_action :set_rating, only: %i[ show edit update destroy ]

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # POST /ratings or /ratings.json
  def create
    @rating_verify = Rating.where(user_id: params[:rating][:user_id], song_id: params[:rating][:song_id]).first
    puts @rating_verify
    if @rating_verify.nil?
      @rating = Rating.new(rating_params)
      @rating.save
    else
      @rating_verify.update(rating_params)
    end

    redirect_to song_path(params[:rating][:song_id])
  end
 

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to rating_url(@rating), notice: "Rating was successfully updated." }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:value, :user_id, :song_id)
    end
end
