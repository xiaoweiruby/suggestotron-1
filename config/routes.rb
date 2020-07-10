Rails.application.routes.draw do
  get 'about' => 'topics#about'
  root 'topics#index'
  resources :topics do
    member do
      post 'upvote'
      post 'downvote'
    end
  end
end
