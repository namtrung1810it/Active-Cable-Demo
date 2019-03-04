Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'chats#index'
  # root 'sessions#new'
  #temporary root path for now 
  mount ActionCable.server => '/cable'
  resources :users, only:[:new, :create] do
    resources :chats, only: [:index, :show, :create]
  end
  resources :sessions, only:[:new, :destroy, :create]
  resources :messages, only:[:create]
end
