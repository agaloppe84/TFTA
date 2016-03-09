Rails.application.routes.draw do

  root to: 'pages#home'

  get "profil" => "pages#profil"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :foodtrucks, except: :destroy do
    resources :reservations, only: [:index, :show, :create, :edit]
    resources :dishes, except: :destroy
    resources :menus, except: :destroy
  end
  resources :dishes, only: [:destroy]
  resources :menus, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"

end
