class PagesController < ApplicationController
  def front
    @drawings = Drawing.oldest.last 5
  end
end