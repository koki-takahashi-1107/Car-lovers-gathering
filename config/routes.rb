Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :admins

  namespace :admin do
    resources :users,only: [:index,:show,:edit,:update]
   	resources :post_images,only: [:index,:new,:create,:show,:edit,:update,]
   	get 'top'=>'post_images#top'
    end

  devise_for :users,:controllers => {
      :sessions => "users/sessions",
      :registrations => "users/registrations",
      :passwords => "users/passwords",
    }

  scope module: :users do
    resources :users, only: [:index, :show, :edit, :update] do
     member do
        get :following, :followers
       end
     resource :relationships, only: [:create, :destroy]
   end

    resources :post_images, only: [:new, :create, :index, :show, :edit, :update :destroy] do
     resources :tags do
      get 'posts_image', to: 'posts#search'
     end
     resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
   end
  end
  get '/search' => 'search#search'
end
