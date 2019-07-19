Rails.application.routes.draw do
  #resources :artists, only: [:index]

  resources :artists, only: [:show, :index] do
    resources :songs, only: [:index, :show]
  end

  resources :songs

end
