class Public::NotificationsController < ApplicationController

 def new
    @notification = Notification.new
 end

 def create
    @notification = Notification.new(notification_params)
    @notification.user_id = current_user.id


    if @notification.save
      flash[:notice] = "You have created notification successfully."
      redirect_to notifications_path
    else
      @user = current_user
      @notification = Notification.all
      render :new
    end


 end

    def index
      @notifications = Notification.all
    end

    def edit
      @notification = Notification.find(params[:id])
    end

    def update
      @notification = Notification.find(params[:id])
      @notification.update(notification_params)
      redirect_to notifications_path
    end

     def destroy
        @notification = Notification.find(params[:id])
        @notification.destroy
        redirect_to notifications_path
     end



 private

  def notification_params
     params.require(:notification).permit(:name, :introduction)
  end
end