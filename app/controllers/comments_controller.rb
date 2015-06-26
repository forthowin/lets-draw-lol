class CommentsController < ApplicationController
  before_action :require_login
  respond_to :js

  def create
    @drawing = Drawing.find params[:drawing_id]
    @comment = Comment.new(drawing: @drawing, user: current_user, body: params[:comment][:body])
    render 'error' unless @comment.save
  end
end