Rails.application.routes.draw do
	devise_for :users, controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }

  resources :users,only: [:show,:edit,:update,:index] do
    member do
      post 'relationships' => 'relationships#create'
      delete 'relationships' => 'relationships#destroy'
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resource :relationships, only: [:create, :destroy]
  end
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create]
  end

  resources :book_comments, only: [:destroy]

  root 'home#top'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
