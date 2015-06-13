class DrawingsController < ApplicationController

  def draw_champion
  end

  def start_draw
    @champion = Category.where(name: 'Champions').first.pictures.sample
    respond_to do |format|
      format.js
    end
  end

  def create
    params[:image].original_filename = SecureRandom.uuid + '.png'
    Drawing.create(image: params[:image], picture_id: params[:picture_id])
    render nothing: true
  end

  def index
    @drawings = Drawing.all
  end
end