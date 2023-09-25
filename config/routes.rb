Rails.application.routes.draw do
  namespace :api do 
    namespace :v0 do 
      resources :forecast, only: [:index]
      resources :users, only: [:create]
    end
    namespace :v1 do 
      get "/book-search", to: "book_search#index"
    end
  end
end
