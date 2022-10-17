class UsersController < ApplicationController
  def index
    @users = User.includes(:rates).all.page params[:page]
  end

  def show
    @user = User.joins(:rates).where(id: params[:id])
  end
end
