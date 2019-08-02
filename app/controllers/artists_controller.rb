class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    if params[:id].present?
      if Artist.where(id: params[:id]).empty?
        flash.alert = "Artist not Found"
        redirect_to artists_path
      else
        @artist = Artist.find(params[:id])
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
    if !params[:artist][:name].blank?
      params.require(:artist).permit(:name)
    end
  end
end
