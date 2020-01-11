class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    #byebug
    @song = Song.new(song_params)
    #byebug
    params[:note_contents].each do |note_content|
      n = Note.create(content: note_content)
      @song.notes << n
    end 
    byebug
    if @song.save
      byebug 
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params[:song].permit(:title, :category_name, :artist_name, :genre_name)
  end
end

