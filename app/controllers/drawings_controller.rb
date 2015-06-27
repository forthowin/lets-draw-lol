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
    @picture = Category.find_by(name: params[:picture_type].capitalize).pictures.sample
    respond_to do |format|
      format.js
    end
  end

  def start_guess
    @drawing = Category.find_by(name: params[:picture_type].capitalize).drawings.sample
    respond_to do |format|
      format.js
    end
  end

  def create
    params[:image].original_filename = SecureRandom.uuid + '.png'
    if user_signed_in?
      @drawing = Drawing.create(image: params[:image], picture_id: params[:picture_id], category_id: params[:category_id], user: current_user)
    else
      @drawing = Drawing.create(image: params[:image], picture_id: params[:picture_id], category_id: params[:category_id])
    end
    respond_to do |format|
      format.js { render :draw_share_buttons }
    end
  end

  def guess_share_buttons
    @drawing = Drawing.find params[:drawing_id]
    @result = "true" == params[:result]
  end

  def index
    if params[:search].blank? && params[:order].blank?
      @drawings = Drawing.order('created_at DESC').page(params[:page])
    else
      @search = params[:search].blank? ? "%" : params[:search].gsub(/[^a-zA-Z]/, "")
      if params[:order] == "Newest" || params[:order].blank?
        @drawings = Drawing.joins(:picture).where("name LIKE ?", @search).order("created_at DESC").page(params[:page])
      elsif params[:order] == "Oldest"
        @drawings = Drawing.joins(:picture).where("name LIKE ?", @search).order("created_at ASC").page(params[:page])
      elsif params[:order] == "Popularity"
        @drawings = Drawing.joins(:picture).where("name LIKE ?", @search).select('drawings.*, count(likes.drawing_id) AS drawing_count').joins('LEFT JOIN likes on drawings.id = likes.drawing_id').group('drawings.id').order('drawing_count DESC, created_at DESC').page(params[:page])
      end
    end
    @search = nil if @search == "%"
    @order = params[:order]
  end

  def show
    @drawing = Drawing.find params[:id]
  end
end