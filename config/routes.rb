Rails.application.routes.draw do

	namespace :api do
	  resources :voters
	end
end
