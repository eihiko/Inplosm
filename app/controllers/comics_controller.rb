class ComicsController < ApplicationController

  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def new
  end

  def create
    @comic = Comic.new(comic_params)
    @comic.save
    redirect_to @comic
  end

  private
  def comic_params
    params.require(:comic).permit(:name, :url)
  end

end
