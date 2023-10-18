class ApplicationController < ActionController::Base

  protected
  def after_sign_in_path_for(resource)
    users_mypage_path
  end

  def after_sign_up_path_for(resource)
    my_page_path
  end
end
