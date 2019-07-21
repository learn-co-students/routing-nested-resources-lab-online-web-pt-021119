Rails.application.routes.draw do
  resources :artists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :songs, only: [:show, :index]
  end

  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
