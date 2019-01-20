Rails.application.routes.draw do
	root 'api/voters#index'
	namespace :api do
	  resources :voters
	end
end
