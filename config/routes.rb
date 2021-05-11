Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :admins

  devise_for :users,:controllers => {
      :sessions => "users/sessions",
      :registrations => "users/registrations",
      :passwords => "users/passwords",
    }

  scope module: :users do
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
       resource :favorites, only: [:create, :destroy]
      
      resources :post_comments, only: [:create, :destroy]
   end
  end

  #resources :post_images, only: [:new, :create, :index, :show, :destroy]
end
