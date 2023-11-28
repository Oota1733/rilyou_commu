class Public::NoticesController < ApplicationController
  before_action :authenticate_user!

  def index
    @notices = current_user.notices.where(checked: false).order(created_at: :desc).page(params[:page]).per(20)
    # @notices.where(checked: false).each do |notice|
    #   notice.update(checked: true)
    # end
  end

  def destroy
    Notice.find(params[:id]).update(checked: true)
    redirect_to notices_path
  end

  def destroy_all
    current_user.notices.where(checked: false).each do |notice|
      notice.update(checked: true)
    end
    redirect_to notices_path
  end
end
