Rails.application.routes.draw do
	root 'api/voters#index'
	get '/api/markers', to: 'api/voters#markers'
	namespace :api do
	  resources :voters
	end
end
