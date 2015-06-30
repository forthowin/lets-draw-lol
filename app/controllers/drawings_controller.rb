class DrawingsController < ApplicationController
  respond_to :js, only: [:start_draw, :start_guess, :create, :guess_share_buttons]

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
  end

  def start_guess
    @drawing = Category.find_by(name: params[:picture_type].capitalize).drawings.sample
  end

  def create
    params[:image].original_filename = SecureRandom.uuid + '.png'
    @drawing = create_drawing
    render :draw_share_buttons
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
      @drawings = Drawing.order_by_dropdown(params[:order], @search).page(params[:page])
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
      Drawing.create(image: params[:image], picture_id: params[:picture_id], category_id: params[:category_id], user: current_user)
    else
      Drawing.create(image: params[:image], picture_id: params[:picture_id], category_id: params[:category_id])
    end
  end
end