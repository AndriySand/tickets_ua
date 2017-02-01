Rails.application.routes.draw do

  devise_for :users
  scope "/admin" do
    resources :users do
      get 'count_unread_messages', on: :member
      get 'unread_messages', on: :member
      resources :messages
    end
  end

  root 'users#index'

end
