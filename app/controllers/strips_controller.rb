class StripsController < ApplicationController

  def index
    @comic = Comic.find(params[:comic_id])
    @strips = @comic.strips
  end

  def show
    @comic = Comic.find(params[:comic_id])
    @strip = Strip.find(params[:id])

  end

  def new
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @strip = @comic.strips.create(strip_params)
    @strip.save
    redirect_to comic_strip_path(@strip)
  end

  private
  def strip_params
    params.require(:strip).permit(:number)
  end

end
