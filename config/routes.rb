Rails.application.routes.draw do
  root "home#top"
  get "about"=> "home#about"
  resources :posts do
    collection do
      post :confirm
    end
  end
end
   

