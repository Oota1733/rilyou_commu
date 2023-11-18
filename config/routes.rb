Rails.application.routes.draw do


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
    get "search" => "searches#search"


    post "users/confirm" => "orders#confirm"
    get "users/complete" => "orders#complete"
    #delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :searches, only: [:index]
    resources :notifications, only: [:new, :index, :update, :destroy, :create, :edit]
    resources :notification_types, only: [:index, :update, :show, :destroy]
    resources :entry_users, only: [:new, :index, :show, :create]
    resources :tags, only: [:new, :index, :update, :destroy, :create, :edit, :show]
    resources :post_comments, only: [:new, :index, :show, :create]
    delete "is_read" => "notices#destroy_all"
    resources :notices, only: [:index, :destroy]
    resources :communities do
      resources :posts, only: [:new, :index, :edit, :show, :create, :update, :destroy] do
        resources :favorites, only: [:create, :destroy]
        resources :comments, only: [:new, :index, :edit, :create, :update, :destroy]
      end
    end
    resources :users, only: [:show,:index,:edit,:update] do
      get :favorites
    end

  end

  #管理者用
  namespace :admin do
    root to: 'notifications#index'
    resources :users, only: [:index, :new, :create, :show, :edit, :update]
    resources :notification_types, only: [:index, :edit, :create, :update, :destroy]
    resources :notifications, only: [:index, :new, :create, :show, :edit, :update]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
    resources :posts, only: [:index, :new, :create, :show, :edit, :update] do
       resources :comments, only: [:destroy]
    end
  end

  # 退会確認画面
  #get  '/user/check' => 'user#check'
  # 論理削除用のルーティング
  patch  '/user/withdraw' => 'users#withdraw'


 #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end