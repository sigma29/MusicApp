class AlbumsController < ApplicationController
  before_action :require_logged_in

  def new
    @album = Album.new
    @bands = Band.all
    @current_band = Integer(params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      @bands = Band.all
      render :new
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      @bands = Band.all
      render :edit
    end

  end

  def destroy
    album = Album.find(params[:id])
    band = album.band
    album.destroy
    redirect_to band_url(band)
  end

  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :recording_type)
  end
end
