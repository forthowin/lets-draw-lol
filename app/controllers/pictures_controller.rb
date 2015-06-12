class PicturesController < ApplicationController
  def draw_champion
    @champion = Category.where(name: 'Champions').first.pictures.sample
  end
end