Rails.application.routes.draw do

  devise_for :users
  scope "/admin" do
    resources :users do
      resources :messages
    end
  end

  root 'users#index'

end
