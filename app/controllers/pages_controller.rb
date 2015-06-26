class PagesController < ApplicationController
  def front
    @drawings = Drawing.last 5
  end
end