class StripsController < ApplicationController
  before_filter :find_comic

  def index
    @strips = @comic.strips
  end

  def show
    @strip = @comic.generate_strip(params[:id])
  end

  def previous
    @strip = crawl(@comic, params[:id].to_i, -1)
    @strip ||= @comic.strips.where(number: params[:id]).first
    redirect_to comic_strip_path(@comic.id, @strip.number)
  end

  def next
    @strip = crawl(@comic, params[:id].to_i, 1)
    @strip ||= @comic.strips.where(number: params[:id]).first
    redirect_to comic_strip_path(@comic.id, @strip.number)
  end


  def new
  end

  def create
    @strip = @comic.strips.create!(strip_params)
    @strip.save
    redirect_to comic_strip_path(@comic.id, @strip.number)
  end

  def destroy
    @strip = @comic.strips.where(number: params[:id]).first
    @strip.destroy
    redirect_to comic_strips_path(@comic.id)
  end

  def tag
    tag_type = params[:tag_type]
    @strip = @comic.generate_strip(params[:id])
    @tag = @strip.generate_tag(tag_type)
    @tag.upvote() 
  end

  private
  def strip_params
    params.require(:strip).permit(:number)
  end

  def find_comic
    @comic = Comic.find(params[:comic_id])
  end
  
  def crawl (comic, start, modifier, max=100)
    strip = nil
    max.times do |i|
      strip = comic.generate_strip((start + (modifier*i) + modifier).to_s)
      break if strip
    end
    return strip
  end

end
