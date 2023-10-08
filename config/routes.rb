Rails.application.routes.draw do

  # devise_for :admins
  # devise_for :users
   #寮生用
  devise_for :users, skip: [:passwords], controllers:{

    sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }


  #寮生用
  scope module: :public do
    root to: 'homes#top'
    get "home/about" => "homes#about", as: "about"
    get "users/mypage" => "users#show"
    get "users/information/edit" => "users#edit"
    patch "users/information" => "users#update"
    get "users/confirm" => "users#confirm"
    patch "users/withdrawal" => "users#withdrawal"


    post "users/confirm" => "orders#confirm"
    get "users/complete" => "orders#complete"
    #delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :notification, only: [:index, :update, :destroy, :create]
    resources :notification_type, only: [:index, :show]
    resources :entry_user, only: [:new, :index, :show, :create]
    resources :community, only: [:index, :edit, :create, :update, :destroy]
    resources :post, only: [:show]
    resources :tag, only: [:index, :edit, :create, :update, :destroy]
    resources :comment, only: [:index, :edit, :create, :update, :destroy]
  end


  #管理者用
  namespace :admin do
    get '/' => 'orders#index'
    resources :admin, only: [:index, :new, :create, :show, :edit, :update]
    resources :admin, only: [:index, :new, :create, :show, :edit, :update]
   

  end

# 退会確認画面
get  '/customers/check' => 'customers#check'
# 論理削除用のルーティング
patch  '/customers/withdraw' => 'customers#withdraw'


 #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
