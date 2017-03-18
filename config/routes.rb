Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root "index#index"

  post "sign_in" => "users#login"
  post "sign_up" => "users#register"
  get "users/me" => "users#me"
  post "meeting" => "meetings#create"

  resources "badges", only: [:index]
end
