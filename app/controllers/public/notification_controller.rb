class Public::NotificationController < ApplicationController

 def new
    @notification = Notification.new
 end

 def create
    @notification = Notification.new(notification_params)

    @notification.user_id = current_user.id


    if @notification.save
      flash[:notice] = "You have created book successfully."
      redirect_to notification_index_path
    else
      @user = current_user
      @notification = Notification.all
      render :new
    end
 end

 private

  def notification_params
     params.require(:notification).permit(:name, :introduction)
  end
end