Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update] do
      get 'list' => 'customers#list'
    end
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:edit, :update, :destroy]
      collection do
        get 'post_comments_list', to: 'post_comments#index', as: 'post_comments_list'
      end
    end
    resources :areas, only: [:index, :create, :edit, :update, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

  scope module: :public do
    root :to => "homes#top"
    get 'homes/about' => 'homes#about'
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe' => 'customers#unsubscribe'
        patch 'withdraw' => 'customers#withdraw'
      end
      resources :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings'
      get 'followers' => 'relationships#followers'
    end
    resources :posts do
      resources :post_comments, only: [:new, :create, :edit, :update, :destroy]
      resource :favorites, only: [:create, :destroy]
      collection do
        get 'map_search' => 'posts#map_search'
        get 'favorites_list', to: 'favorites#index', as: 'favorites_list'
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
