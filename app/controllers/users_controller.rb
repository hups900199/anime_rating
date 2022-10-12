class UsersController < ApplicationController
  def index
    @users = User.includes(:rates).all.page params[:page]
  end

  def show
    @user = User.find(params[:id])
    @rate = Rate.where(user_id: params[:id])
  end
end
