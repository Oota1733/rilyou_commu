class Public::NoticesController < ApplicationController
  
  def index
    @notices = current_end_user.notices.order(created_at: :desc).page(params[:page]).per(20)
    @notices.where(checked: false).each do |notice|
      notice.update(checked: true)
    end
  end

  def destroy
    @notices = current_user.notices.destroy_all
    redirect_to users_mypage_path
  end
end
