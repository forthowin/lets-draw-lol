class LikesController < ApplicationController
  respond_to :js

  def create
    @drawing = Drawing.find params[:drawing_id]
    like = Like.new(drawing_id: params[:drawing_id], user: current_user)
    if like.save
      render :like
    else
      Like.where("drawing_id = ? AND user_id = ?", params[:drawing_id], current_user.id).first.destroy
      render :unlike
    end
  end
end