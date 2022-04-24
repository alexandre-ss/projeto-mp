class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new create update recommend]

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

  def recommend 
    user_interests = current_user.interests.where(opinion: true)
    common_users = []
    user_songs = []
    user_interests.each do |user_interest|
      user_songs << Song.find_by(id: user_interest.song_id)
    end
    user_songs.each do |us|
      common_interests = Interest.where(song_id: us.id,opinion: true)
      common_interests.each do |ci|
        common_users << User.find_by(id: ci.user_id) 
      end
    end
   # puts "COMMON USER #{common_users.inspect}"
    popular_songs = []
    common_users.each do |common_user|
      interesses_relevantes = common_user.interests.where(opinion: true)
      interesses_relevantes.each do |interesses_relevante|
        popular_songs << interesses_relevante.song
      end
    end
    puts "POPULAR SONGS //////////////// #{popular_songs.inspect}"

    popular_songs.each do |popular_song|
      dislikes = popular_song.interests.where(user_id: current_user.id, opinion: false)
    end
    popular_songs.each do |popular_song|
      dislike = popular_song.interests.where(user_id: current_user.id, opinion: false).first
      if user_songs.include?(popular_song) || popular_song == dislike
        popular_songs[popular_songs.find_index(popular_song)] = 0
      end
    end

    counter = {}
    popular_songs.each do |s|
      if s != 0
        counter[s.title] ||= 0
        counter[s.title] += 1
      end
    end
    puts counter
    most_populars = counter.sort_by{ |k, v| -v}.first(5).map(&:first)
    @top_most_popular = []
    most_populars.each do |s|
      aux = Song.find_by(title: s)
      @top_most_popular << aux
    end
    if @top_most_popular.empty? 
      @top_most_popular = most_popular
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
    return @top_most_popular
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
