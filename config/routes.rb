Rails.application.routes.draw do

  # devise_for :admins
  # devise_for :users
   #寮生用
  devise_for :users, skip: [:passwords], controllers:{
    registrations: 'public/registrations',
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
    resources :notification, only: [:new, :index, :update, :destroy, :create, :edit]
    resources :notification_types, only: [:index, :update, :show, :destroy]
    resources :entry_users, only: [:new, :index, :show, :create]
    resources :post_comments, only: [:new, :index, :show, :create]
    resources :communities do
      resources :posts, only: [:new, :index, :edit, :show, :create, :update, :destroy] do
        resources :comments, only: [:index, :edit, :create, :update, :destroy]
      end
    end

    # resources :tags, only: [:index, :edit, :create, :update, :destroy]

  end


  #管理者用
  namespace :admin do
    get '/' => 'orders#index'
    resources :admin, only: [:index, :new, :create, :show, :edit, :update]
    resources :user, only: [:index, :new, :create, :show, :edit, :update]
    resources :notification_type, only: [:index, :edit, :create, :update, :destroy]
    resources :notification, only: [:index, :new, :create, :show, :edit, :update]
  end

# 退会確認画面
get  '/user/check' => 'user#check'
# 論理削除用のルーティング
patch  '/user/withdraw' => 'users#withdraw'


 #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
