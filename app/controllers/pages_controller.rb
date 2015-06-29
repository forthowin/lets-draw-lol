class PagesController < ApplicationController
  def front
    @drawings = Drawing.order("created_at ASC").last 5
  end
end