class BandsController < ApplicationController
  before_action :require_logged_in

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end

  end

  def destroy
    Band.find(params[:id]).destroy
    redirect_to bands_url
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
    render :show
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
