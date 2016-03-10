Rails.application.routes.draw do

  root to: 'pages#home'

  get "profil" => "pages#profil"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :foodtrucks, except: :destroy do
    resources :reservations, only: [:index, :show, :create]
    resources :dishes, except: :destroy
    resources :menus, except: :destroy
  end

  resources :order_lines, only: [:create]
  resources :reservations, only: [:update] do
    member do
      post :accept
      post :refuse
    end
  end

  resources :dishes, only: [:destroy]
  resources :menus, only: [:destroy] do
    resources :carts, only: [:create]
  end
  resources :carts, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"

end
