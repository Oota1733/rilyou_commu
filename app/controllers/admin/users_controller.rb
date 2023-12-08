class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @user = User.all
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:student_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :encrypted_password, :postal_code, :address, :is_active, :inactive)
  end


end
