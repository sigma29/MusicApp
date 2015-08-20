class TracksController < ApplicationController
  before_action :require_logged_in

  def new
    @track = Track.new
    @albums = Album.all
    @current_album = Integer(params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @albums = Album.all
      render :new
    end
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @albums = Album.all
      render :edit
    end

  end

  def destroy
    track = Track.find(params[:id])
    album = track.album
    track.destroy
    redirect_to album_url(album)
  end

  def show
    @track = Track.find(params[:id])
    @notes = @track.notes.includes(:user)
    render :show
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :track_type)
  end
end
