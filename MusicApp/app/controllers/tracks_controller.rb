class TracksController < ApplicationController
  before_action :require_logged_in

  def new
    @track = Track.new
    @albums = Album.all
    @current_band = Integer(params[:band_id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @bands = Band.all
      render :new
    end
  end

  def edit
    @bands = Band.all
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @bands = Band.all
      fail
      render :edit
    end

  end

  def destroy
    Track.find(params[:id]).destroy
    redirect_to bands_url
  end

  def show
    @track = Track.find(params[:id])
    @tracks = @track.tracks
    render :show
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :track_type)
  end
end
