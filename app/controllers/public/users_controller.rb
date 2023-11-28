class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user

    if user.update(user_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to users_mypage_path
    else
      render :edit
    end
  end

  def confirm

  end


  def withdrawal
     @user = User.find(current_user.id)
     # is_deletedカラムをtrueに変更することにより削除フラグを立てる
     @user.update(is_active: false)
     reset_session
     flash[:notice] = "退会処理を実行いたしました"
     redirect_to root_path
  end

  def favorites
     @user = User.find(params[:user_id])
     favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
     @favorite_posts = Post.find(favorites)
  end


  private

  def user_params
  params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                   :postal_code, :address, :phone_number, :email)
  end
end
