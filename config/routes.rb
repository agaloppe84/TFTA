Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :foodtrucks, except: :destroy do
    resources :reservations, only: [:index, :show, :create]
    resources :dishes, except: :destroy
    resources :menus, except: :destroy
  end

  resources :order_lines, only: [:create]
  resources :reservations, only: [:update]

  resources :dishes, only: [:destroy]
  resources :menus, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"

end
