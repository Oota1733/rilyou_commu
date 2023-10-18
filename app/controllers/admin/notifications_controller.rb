class Admin::NotificationsController < ApplicationController

   before_action :authenticate_admin!

  def index
    @notification = Notification.all
    @notifications = Notification.page(params[:page]).per(10)
  end

  def show
    @notification = Notification.find(params[:id])
  end

  def edit
    @notification = Notification.find(params[:id])
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(notification_params)
    redirect_to admin_notification_path(@user.id)
  end

  private

  def customer_params
    params.require(:notification).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :encrypted_password, :postal_code, :address, :is_active)
  end
end
