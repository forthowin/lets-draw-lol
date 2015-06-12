class PicturesController < ApplicationController
  def draw_champion
  end

  def start_draw
    @champion = Category.where(name: 'Champions').first.pictures.sample
    respond_to do |format|
      format.js
    end
  end
end