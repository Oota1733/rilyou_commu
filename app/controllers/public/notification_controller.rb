class Public::NotificationController < ApplicationController

 def new
    @user = User.new
 end
end