class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new create update]

  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
    @rating = Rating.new
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs or /songs.json
  def create
    unless current_user.nil?
      @song = Song.new(song_params)
      @song.user_id = current_user.id 
      respond_to do |format|
        if @song.save
          format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
          format.json { render :show, status: :created, location: @song }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @song.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    if current_user.id == @song.user_id
      @song.destroy

      respond_to do |format|
        format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def most_popular
    popular_songs = Interest.where(opinion: true)
    counter = {}
    @top_most_popular = []
    popular_songs.each do |s|
      song = Song.find_by(id: s.song_id)
      counter[song.title] ||= 0
      counter[song.title] += 1
    end
    most_populars = counter.sort_by{ |k, v| -v}.first(5).map(&:first)

    most_populars.each do |s|
      aux = Song.find_by(title: s)
      @top_most_popular << aux
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :artist, :user_id)
    end
end
