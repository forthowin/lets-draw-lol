class Users::UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @drawings = @user.drawings.page(params[:drawings_page]).per(20)
    @like_drawings = Drawing.joins(:likes).where("likes.user_id = ?", @user.id).page(params[:like_drawings_page]).per(20)
  end
end