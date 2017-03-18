Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root "index#index"

  post "sign_in" => "users#login"
  get "sign_in" => "users#sign_in"
  post "sign_up" => "users#register"
	get "sign_up" => "users#new"
  delete "sign_out" => "users#sign_out"

  get "secret" => "index#secret"

end
