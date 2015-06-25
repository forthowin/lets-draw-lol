class Users::UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @drawings = @user.drawings.page(params[:page])
  end
end