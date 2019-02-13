Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"

  resources :restaurants do
    # inside create connections to restaurants/42/reviews
    resources :reviews, only: [ :new, :create ]
  end
  # We don't need restaurant_id for the show, edit, update, destroy or a review!
  # resources :reviews, only: [ :show, :edit, :update, :destroy ]
end



# new_restaurant_review  GET   /restaurants/:restaurant_id/reviews/new  reviews#new
# restaurant_reviews  POST  /restaurants/:restaurant_id/reviews      reviews#create
