Rails.application.routes.draw do
	
	root 'api/voters#index'
	
	get '/api/markers', to: 'api/voters#markers'
	
	get '/api/stats', to: 'api/voters#stats'
	
	namespace :api do
	  resources :voters
	end
end
