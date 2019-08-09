class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    if params[:song_id]
      if Song.where(id: params[:song_id]).present?
        @song = Song.find(params[:song_id])
      else
        flash[:error] = "Song not found."
        redirect_to artist_songs_path(@artist)
      end
     end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
