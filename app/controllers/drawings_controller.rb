class DrawingsController < ApplicationController

  def draw_champion
  end

  def draw_pros
  end

  def guess_champion
  end

  def guess_pros
  end

  def start_draw
    @picture = Category.where(name: params[:picture_type].capitalize).first.pictures.sample
    respond_to do |format|
      format.js
    end
  end

  def start_guess
    @drawing = Category.where(name: params[:picture_type].capitalize).first.drawings.sample
    respond_to do |format|
      format.js
    end
  end

  def create
    params[:image].original_filename = SecureRandom.uuid + '.png'
    @drawing = Drawing.create!(image: params[:image], picture_id: params[:picture_id], category_id: params[:category_id])
    respond_to do |format|
      format.js { render :draw_share_buttons }
    end
  end

  def guess_share_buttons
    @drawing = Drawing.find params[:drawing_id]
    @result = "true" == params[:result]
  end

  def index
    @drawings = Drawing.all
  end

  def show
    @drawing = Drawing.find params[:id]
  end
end