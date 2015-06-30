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
    create_drawing
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
      @drawings = Drawing.newest.page(params[:page])
    else
      @search = params[:search].blank? ? "%" : params[:search].gsub(/[^a-zA-Z]/, "")
      query_drawing_by_order
    end
    @search = nil if @search == "%"
    @order = params[:order]
  end

  def show
    @drawing = Drawing.find params[:id]
  end

  private

  def create_drawing
    if user_signed_in?
      @drawing = Drawing.create(image: params[:image], picture_id: params[:picture_id], category_id: params[:category_id], user: current_user)
    else
      @drawing = Drawing.create(image: params[:image], picture_id: params[:picture_id], category_id: params[:category_id])
    end
  end

  def query_drawing_by_order
    case params[:order]
    when "Oldest"
      @drawings = Drawing.joins(:picture).where("name LIKE ?", @search).oldest.page(params[:page])
    when "Popularity"
      @drawings = Drawing.popular(@search).page(params[:page])
    when "Comments"
      @drawings = Drawing.most_comments(@search).page(params[:page])
    else
      @drawings = Drawing.joins(:picture).where("name LIKE ?", @search).newest.page(params[:page])
    end
  end
end